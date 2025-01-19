import 'package:Food/blocs/favourites/favourites_bloc.dart';
import 'package:Food/blocs/favourites/favourites_state.dart';
import 'package:Food/theme/color.dart';
import 'package:Food/theme/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../blocs/favourites/favourites_event.dart';
import '../../theme/text_style.dart';

class FavouritePageScreen extends StatelessWidget {
  const FavouritePageScreen({super.key});

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
                  child: BlocBuilder<FavoritesBloc,FavouritesState>(builder: (context,state){
                    if(state.favoriteMeals!=null && state.favoriteMeals!.isNotEmpty){
                      return ListView.builder(
                          itemCount: state.favoriteMeals!.length,
                          physics:const BouncingScrollPhysics(),
                          itemBuilder: (context,index){
                            final meal = state.favoriteMeals![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5.0),
                              child: Slidable(
                                  endActionPane: ActionPane(
                                      motion: const StretchMotion(),
                                      children: [
                                        SlidableAction(
                                            icon: Icons.delete,
                                            foregroundColor: Colors.white,
                                            backgroundColor: redColor,
                                            label: 'Remove favorite',
                                            borderRadius: BorderRadius.circular(12),
                                            onPressed: (context){

                                        })
                                  ]),
                                  child: listTileItem(context, size,meal)),
                            );
                          }
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite,size: 150,color: greyColor.withOpacity(0.4),),
                          Text('No favorites yet',style: kTextStyleColor600(blackColor, 20, true),),
                          heightBox(10),
                          Text('Make your favorite workouts and always have them here.',textAlign: TextAlign.center,style: kTextStyleColor800(greyColor, 14, false),),
                        ],
                      ),
                    );
                  })
              )
            ],
          ),
      ),
    );
  }
  



}