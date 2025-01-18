import 'package:Food/theme/color.dart';
import 'package:Food/theme/ui_helper.dart';
import 'package:flutter/material.dart';
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
                  child: ListView.builder(
                      itemCount: 10,
                      physics:const BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return listTileItem(context, size);
                      }
                  )
              )
            ],
          ),
      ),
    );
  }
  



}