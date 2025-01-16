import 'package:Food/blocs/dashboard/dashboard_bloc.dart';
import 'package:Food/blocs/dashboard/dashboard_event.dart';
import 'package:Food/blocs/dashboard/dashboard_state.dart';
import 'package:Food/blocs/home/home_bloc.dart';
import 'package:Food/blocs/home/home_event.dart';
import 'package:Food/pages/dashboard/category.dart';
import 'package:Food/pages/dashboard/favourite.dart';
import 'package:Food/theme/ui_helper.dart';
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
      context.read<HomeBloc>().add(GetRandomMeal());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // for app orientation
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: greyColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: BlocBuilder<DashboardBloc,DashboardState>(builder: (context,state){
          return _selectedWidget(state.selectedTabIndex);
        }),
        bottomNavigationBar: _buildMyNavBar(context,size),
      ),
    );
  }

  Widget _buildMyNavBar(BuildContext context,Size size){
    return Container(
      height: size.height * 0.095,
      padding: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, -10),
            )
          ],
        color:greyColor,
        border: Border.all(color: greyColor,width: 1.5)
      ),
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
          decoration:kCustomBoxDecoration(25, Colors.transparent, index == state.selectedTabIndex ?whiteColor:Colors.transparent) ,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Icon(
            icon,
            color: whiteColor,
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
