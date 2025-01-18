import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_state.dart';
import '../../model/home/meal_category_model.dart';
import '../../theme/color.dart';
import '../../theme/text_style.dart';
import '../../theme/ui_helper.dart';
import '../../utility/enum.dart';

class CategoryPageScreen extends StatelessWidget {
  const CategoryPageScreen({super.key});

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



}