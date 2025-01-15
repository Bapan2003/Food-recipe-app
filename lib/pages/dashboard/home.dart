import 'package:Food/theme/ui_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
        Container(
          decoration: kCustomBoxDecorationWithShadow(15, Colors.transparent, greyColor, blackColor),
          height: size.height*0.30,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
                imageUrl: 'https://www.themealdb.com/images/media/meals/8x09hy1560460923.jpg',
                height: size.height*0.30,
                width: size.width,
                fit: BoxFit.fill,
                errorWidget: (context,error,imgUrl){
                  return Icon(Icons.error);
                },
            ),
          ),
        ),
      ],
    ));
  }
}
