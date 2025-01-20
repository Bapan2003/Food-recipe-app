import 'package:Food/blocs/search/search_bloc.dart';
import 'package:Food/blocs/search/search_event.dart';
import 'package:Food/blocs/search/search_state.dart';
import 'package:Food/utility/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/color.dart';
import '../../theme/text_style.dart';
import '../../theme/ui_helper.dart';
import '../details/meal_details.dart';

class SearchPageScreen extends StatelessWidget {
  static const String rootName='searchPage';
  const SearchPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: greyColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: whiteColor,
          body: SafeArea(
              child: Column(
                children: [

                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widthBox(20),
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context,true);
                            },
                            child: Icon(Icons.arrow_back)),
                        Flexible(child: _searchBar(context,size))
                      ],
                    ),
                  Expanded(
                      child: BlocBuilder<SearchBloc,SearchState>(builder: (context,state){
                        if(state.status==ResponseStatus.success){
                          return ListView.builder(
                            padding: EdgeInsets.fromLTRB(20, 0,20,10),
                              itemCount: state.mealList!.length,
                              itemBuilder: (context,index){
                                return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: GestureDetector(
                                        onTap: (){
                                          Navigator.pushReplacementNamed(context, MealDetailsPageScreen.rootName, arguments: state.mealList![index].idMeal);
                                        },
                                        child: listTileItem(context, size, state.mealList![index])));
                              });
                        }
                        return const SizedBox.shrink();
                      })
                  )
                ],
              )
          ),
        ),
    );
  }

  Widget _searchBar(BuildContext context,Size size){
    return Container(
      width: size.width,
      margin: const EdgeInsets.symmetric(
          horizontal: 20.0,vertical: 10),
      padding: EdgeInsets.all(5),
      decoration: kCustomBoxDecoration(12, whiteColor, Colors.black12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/Foodie.png'),width: 40,height:40,),
          Expanded(
              child: TextField(
                autofocus: true,
                style: kTextStyleColor600(blackColor, 15, false),
                decoration: InputDecoration(
                  hintText: 'Search by name...',
                  hintStyle: kTextStyleColor600(greyColor, 15, false),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                textInputAction: TextInputAction.search,
                onChanged: (val){
                   context.read<SearchBloc>().add(GetSearchMealList(searchKey: val));
                },
                onSubmitted: (val){
                  context.read<SearchBloc>().add(GetSearchMealList(searchKey: val));
                },
              )
          ),
          Icon(Icons.search,size: 35,color: blackColor.withOpacity(0.5),),
        ],
      ),
    );
  }
}
