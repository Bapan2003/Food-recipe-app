import 'package:Food/blocs/category/category_bloc.dart';
import 'package:Food/blocs/category/category_event.dart';
import 'package:Food/blocs/category/category_state.dart';
import 'package:Food/utility/enum.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/color.dart';
import '../../theme/text_style.dart';
import '../../theme/ui_helper.dart';
import '../details/meal_details.dart';
import 'package:firebase_analytics/firebase_analytics.dart';


class MealsByCategoryPageScreen extends StatefulWidget {
  static const String rootName='mealsByCategory';
  final String strCategory;
  const MealsByCategoryPageScreen({super.key,required this.strCategory});

  @override
  State<MealsByCategoryPageScreen> createState() => _MealsByCategoryPageScreenState();
}

class _MealsByCategoryPageScreenState extends State<MealsByCategoryPageScreen> {
  late CategoryBloc _categoryBloc;

  @override
  void initState() {
    super.initState();
    _categoryBloc=CategoryBloc()..add(GetAllMealByCategory(strCategory: widget.strCategory));
    setCurrentScreen("category");

  }


  @override
  void dispose() {
    super.dispose();
    _categoryBloc.close();
  }


  void setCurrentScreen(String screenName) {
    FirebaseAnalytics.instance.setCurrentScreen(
      screenName: screenName,
    );
    print("hi");
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocProvider(
      create: (_)=>_categoryBloc,
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: greyColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: whiteColor,
          body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   appBar(context, widget.strCategory),
                    Expanded(
                        child: BlocBuilder<CategoryBloc,CategoryState>(builder: (context,state){
                          if(state.status==ResponseStatus.loading){
                            return ListView.builder(
                                itemCount: 5,
                                physics:const BouncingScrollPhysics(),
                                itemBuilder: (context,index){
                                  return shimmerListTileEffect(context, size);
                                }
                            );
                          }else if(state.status==ResponseStatus.failure){
                            return const SizedBox.shrink();
                          }else{
                            return ListView.builder(
                                itemCount: state.mealListByCategory!.length,
                                physics:const BouncingScrollPhysics(),
                                padding: EdgeInsets.only(bottom: 20),
                                itemBuilder: (context,index){
                                  return _listTileItem(context, size,state.mealListByCategory![index].strMeal??'',state.mealListByCategory![index].strMealThumb??'',state.mealListByCategory![index].idMeal??'');
                                }
                            );
                          }
                        })
                    )
                ],
              ),
          ),
        ),
      ),
    );
  }
 Widget _listTileItem(BuildContext context, Size size,String strMeal, String imgUrl, String mealId){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, MealDetailsPageScreen.rootName, arguments: mealId);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        height: size.height*0.15,
        width: size.width*0.45,
        decoration: kCustomBoxDecorationWithShadow(12, whiteColor, greyColor.withOpacity(0.4),blackColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12)
              ),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                height: size.height*0.15,
                width: size.width*0.45,
                fit:BoxFit.cover,
                errorWidget: (context,error,imgUrl){
                  return Container(
                      height: size.height*0.15,
                      width: size.width*0.45,
                      color: greyColor,
                      child: Icon(Icons.error));
                },
              ),

            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(strMeal??'',style: kTextStyleColor800(blackColor, 18, false),maxLines: 4,overflow: TextOverflow.ellipsis,softWrap: true,),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
 }
}
