import 'package:Food/blocs/dashboard/dashboard_bloc.dart';
import 'package:Food/blocs/dashboard/dashboard_event.dart';
import 'package:Food/blocs/dashboard/dashboard_state.dart';
import 'package:Food/blocs/home/home_bloc.dart';
import 'package:Food/blocs/home/home_event.dart';
import 'package:Food/pages/dashboard/category.dart';
import 'package:Food/pages/dashboard/favourite.dart';
import 'package:Food/theme/ui_helper.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/color.dart';
import 'home.dart';

class DashboardPageScreen extends StatefulWidget {
  static const String rootName='dashboard';
  const DashboardPageScreen({super.key});

  @override
  State<DashboardPageScreen> createState() => _DashboardPageScreenState();
}

class _DashboardPageScreenState extends State<DashboardPageScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _getData();
      context.read<HomeBloc>().add(GetPopularMealList());
      context.read<HomeBloc>().add(GetMealCategory());
    });
  }


  void _getData(){
    context.read<HomeBloc>().add(GetRandomMeal());
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: greyColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: RefreshIndicator(
        onRefresh: () async{ _getData(); },
        child: Scaffold(
          body: BlocBuilder<DashboardBloc,DashboardState>(builder: (context,state){
            return _selectedWidget(state.selectedTabIndex);
          }),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: greyColor,
            items: <Widget>[
              Icon(Icons.home, size: 35,color: whiteColor,),
              Icon(Icons.favorite, size: 35,color: whiteColor,),
              Icon(Icons.category, size: 35,color: whiteColor,),
            ],
            onTap: (index) {
              //Handle button tap
              context.read<DashboardBloc>().add(SetTabIndex(index: index));

            },
          ),
        ),
      ),
    );
  }

  Widget _buildMyNavBar(BuildContext context,Size size){
    return Container(
      height: size.height * 0.085,
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: kCustomBoxDecorationWithShadow(40, whiteColor, whiteColor, blackColor),
      child: BlocBuilder<DashboardBloc,DashboardState>(builder: (context,state){
        final dashboardBloc=context.read<DashboardBloc>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTab(index: 0, icon: Icons.home, state: state, dashboardBloc: dashboardBloc),
            _buildTab(index: 1, icon: Icons.favorite, state: state, dashboardBloc: dashboardBloc),
            _buildTab(index: 2, icon: Icons.category, state: state, dashboardBloc: dashboardBloc),
          ],
        );
      }),
    );
  }


  Widget _buildTab({
    required int index,
    required IconData icon,
    required DashboardState state,
    required DashboardBloc dashboardBloc,
  }) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          dashboardBloc.add(SetTabIndex(index: index));
        },
        child: AnimatedContainer(
          decoration:kCustomBoxDecoration(25, index == state.selectedTabIndex ?greyColor:Colors.transparent, index == state.selectedTabIndex ?greyColor:Colors.transparent) ,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Icon(
            icon,
            color: index == state.selectedTabIndex ?whiteColor:greyColor.withOpacity(0.5),
            size: 35,
          ),
        ),
      ),
    );
  }

  Widget _selectedWidget(int selectedTabIndex) {
    switch (selectedTabIndex){
      case 0:
        return HomePageScreen();
      case 1:
        return FavouritePageScreen();
      case 2:
        return CategoryPageScreen();
      default:
      return HomePageScreen();

    }
  }
}
