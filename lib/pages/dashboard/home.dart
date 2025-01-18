import 'package:Food/blocs/home/home_bloc.dart';
import 'package:Food/blocs/home/home_state.dart';
import 'package:Food/model/home/meal_category_model.dart';
import 'package:Food/model/home/popular_meal_model.dart';
import 'package:Food/theme/ui_helper.dart';
import 'package:Food/utility/enum.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/color.dart';
import 'package:Food/theme/text_style.dart';


class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Column(
            children: [
              Container(
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
                        child: Text('Search by name...',style: kTextStyleColor600(greyColor, 15, false),)),
                    Icon(Icons.search,size: 35,color: blackColor.withOpacity(0.5),),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _titleSection('Would you like to eat'),
                      heightBox(5),
                      BlocBuilder<HomeBloc,HomeState>(builder: (context,state){
                        if(state.randomMealStatus==ResponseStatus.loading){
                          return  shimmerEffect(
                            height: size.height*0.30,
                            width: size.width,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                          );
                        }else if(state.randomMealStatus==ResponseStatus.failure){
                          return Text(state.mealCategoryError);
                        }else{
                          return _bannerImage(size, state.mealsModelClass!.strMealThumb??'');
                        }

                      }),
                      heightBox(20),
                      _titleSection('Popular Meal'),
                      heightBox(5),
                      SizedBox(
                        height: size.height*0.15,
                        child: BlocBuilder<HomeBloc,HomeState>(
                            buildWhen: (old,current)=>old.popularMealList!=current.popularMealList,
                            builder: (context,state){
                              if(state.popularMealStatus==ResponseStatus.loading){
                                return ListView.builder(
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    itemBuilder: (context,index){
                                      return shimmerEffect(
                                        height: size.height*0.15,
                                        width: size.width*0.5,
                                        margin: EdgeInsets.symmetric(horizontal: 5),
                                      );
                                    });
                              }else if(state.popularMealStatus==ResponseStatus.failure){
                                return Text(state.mealCategoryError);
                              }else{
                                return _popularMeal(size,state.popularMealList!);
                              }

                            }),
                      ),

                      heightBox(20),
                      _titleSection('Category'),
                      heightBox(5),
                      BlocBuilder<HomeBloc,HomeState>(
                          buildWhen: (old,current)=>old.mealCategoryList!=current.mealCategoryList,
                          builder: (context,state){
                            if(state.mealCategoryStatus==ResponseStatus.loading){
                              return GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5, // Space between columns
                                mainAxisSpacing: 5,
                                childAspectRatio: 1.27,// Space between rows
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                shrinkWrap: true,
                                primary: false,
                                children: List.generate(10, (index){
                                  return shimmerEffect();
                                }),

                              );
                            }else if(state.mealCategoryStatus==ResponseStatus.failure){
                              return Text(state.mealCategoryError);
                            }else{
                              return state.mealCategoryList!=null?mealCategory(context,size,state.mealCategoryList!):const SizedBox.shrink();
                            }

                          }),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _titleSection(String title){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(title,style: kTextStyleColor500(blackColor, 20, true,),),
    );
  }

  Widget _bannerImage(Size size,String imgUrl){
    return Container(
      decoration: kCustomBoxDecorationWithShadow(15, orangeGreyColor, orangeGreyColor, blackColor),
      height: size.height*0.30,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          height: size.height*0.30,
          width: size.width,
          fit: BoxFit.fill,
          errorWidget: (context,error,imgUrl){
            return Icon(Icons.error);
          },
        ),
      ),
    );
  }

  Widget _popularMeal(Size size,List<PopularMealModel> mealList){
    return ListView.builder(
        itemCount: mealList.length,
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
           return _popularMealImage(size,mealList[index].strMealThumb??'');
    });
  }


  Widget _popularMealImage(Size size,String imgUrl){
    return Container(
      decoration: kCustomBoxDecoration(15, orangeGreyColor, orangeGreyColor, ),
      height: size.height*0.15,
      width: size.width*0.5,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          height: size.height*0.15,
          width: size.width,
          fit: BoxFit.fill,
          errorWidget: (context,error,imgUrl){
            return Icon(Icons.error);
          },
        ),
      ),
    );
  }
  

}
