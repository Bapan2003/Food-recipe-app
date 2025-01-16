import 'package:Food/blocs/home/home_bloc.dart';
import 'package:Food/blocs/home/home_state.dart';
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
    return SafeArea(child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightBox(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Home',style: kTextStyleColor600(blackColor, 40, true,cairo: true),),
              Icon(Icons.search,size: 30,)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('Would you like to eat',style: kTextStyleColor500(blackColor, 25, true,),),
        ),
        heightBox(5),
        BlocBuilder<HomeBloc,HomeState>(builder: (context,state){
          if(state.status==ResponseStatus.loading){
            return CircularProgressIndicator();
          }else if(state.status==ResponseStatus.failure){
            return Text('Error');
          }else{
            return Container(
              decoration: kCustomBoxDecorationWithShadow(15, Colors.transparent, greyColor, blackColor),
              height: size.height*0.30,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: state.mealsModelClass!.strMealThumb??'',
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

        }),
      ],
    ));
  }
}
