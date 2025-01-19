import 'package:Food/blocs/details/meal_details_bloc.dart';
import 'package:Food/blocs/details/meal_details_event.dart';
import 'package:Food/blocs/details/meal_details_state.dart';
import 'package:Food/blocs/favourites/favourites_bloc.dart';
import 'package:Food/blocs/favourites/favourites_event.dart';
import 'package:Food/blocs/favourites/favourites_state.dart';
import 'package:Food/blocs/home/home_bloc.dart';
import 'package:Food/theme/color.dart';
import 'package:Food/theme/text_style.dart';
import 'package:Food/theme/ui_helper.dart';
import 'package:Food/utility/enum.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailsPageScreen extends StatefulWidget {
  static const String rootName='mealDetails';
  final String id;
  const MealDetailsPageScreen({super.key, required this.id});

  @override
  State<MealDetailsPageScreen> createState() => _MealDetailsPageScreenState();
}

class _MealDetailsPageScreenState extends State<MealDetailsPageScreen> {
  late MealDetailsBloc _mealDetailsBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mealDetailsBloc=MealDetailsBloc()..add(GetMealDetails(id: widget.id));
  }

  @override
  void dispose() {
    super.dispose();
    _mealDetailsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => _mealDetailsBloc, // Provide the MealDetailsBloc
      child: Scaffold(
        backgroundColor:whiteColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              primary: true,
              expandedHeight: size.height * 0.35,
              flexibleSpace: FlexibleSpaceBar(
                background: _appBarBackGround(size),
                  expandedTitleScale: 1.2,
                  title:SafeArea(child: Container(
                  width: size.width,
                  padding: EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(child: BlocBuilder<MealDetailsBloc,MealDetailsState>(builder: (context,state){
                        if(state.status==ResponseStatus.loading|| state.status==ResponseStatus.failure){
                          return appBar(context, '',);
                        }
                        return appBar(context, state.mealsModelClass!.strMeal??'',);
                      })),
                      BlocBuilder<FavoritesBloc,FavouritesState>(builder: (context,state){
                        final isFavorite = state.favoriteMeals?.any((favMeal) => favMeal.idMeal == widget.id) ?? false;
                        return CircleAvatar(
                          backgroundColor: whiteColor,
                          child: GestureDetector(
                              onTap: (){
                                if(isFavorite){
                                  context.read<FavoritesBloc>().add(RemoveFavorite(widget.id));
                                }else{
                                  context.read<FavoritesBloc>().add(AddFavorite(context.read<MealDetailsBloc>().state.mealsModelClass!));
                                }
                              },
                              child: Icon(!isFavorite?Icons.favorite_border_outlined:Icons.favorite,color: redColor,)),
                        );
                      })
                    ],
                  ),
                )),
              ),
            ),
            // SliverToBoxAdapter to contain the content with a curve on top
            SliverList(delegate: SliverChildListDelegate([
              BlocBuilder<MealDetailsBloc,MealDetailsState>(builder: (context,state){
                if(state.status==ResponseStatus.success){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on,color:redColor,),
                                widthBox(5),
                                Text(state.mealsModelClass!.strArea??'',style: kTextStyleColor600(blackColor, 15, false),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.local_offer_rounded,color: blackColor,),
                                widthBox(5),
                                Text(state.mealsModelClass!.strTags??'',style: kTextStyleColor600(blackColor, 15, false),)
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   children: [
                            //     Icon(Icons.category,),
                            //     widthBox(5),
                            //     Text(state.mealsModelClass!.strCategory??'',style: kTextStyleColor600(blackColor, 15, false),)
                            //   ],
                            // ),
                          ],
                        ),
                        heightBox(20),
                        Text('Instructions:',style: kTextStyleColor500(blackColor, 22, true),),
                        Text(state.mealsModelClass!.strInstructions??'',style: kTextStyleColor500(blackColor, 15, false),),
                        heightBox(50)
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),


            ])),


          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: (){

           },
          backgroundColor: whiteColor,
          child: Icon(Icons.play_circle_outlined,color: redColor,size: 30,),
        ),
      ),
    );
  }

  Widget _appBarBackGround(Size size){
    return Stack(
      children: [
        BlocBuilder<MealDetailsBloc,MealDetailsState>(builder: (context,state){
          if(state.status==ResponseStatus.loading){
            return shimmerEffect(width: size.width,height: size.height * 0.35);
          }else if(state.status==ResponseStatus.failure){
            return Text(state.error);
          }else{
            return CachedNetworkImage(
              imageUrl: state.mealsModelClass!.strMealThumb!,
              width: size.width,
              fit: BoxFit.cover,
            );
          }
        }),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                greyColor.withOpacity(0.8),
                greyColor.withOpacity(0.0)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        )
      ],
    );
  }
}
