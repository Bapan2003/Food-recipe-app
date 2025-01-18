//  Box Decoration
import 'package:Food/pages/category/meals_by_category.dart';
import 'package:Food/theme/color.dart';
import 'package:Food/theme/text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../model/home/meal_category_model.dart';

BoxDecoration kCustomBoxDecorationWithShadow(
    double radius, Color bgColor, Color borderColor, Color shadowColor) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: borderColor),
    color: bgColor,
    boxShadow: [
      BoxShadow(
        color: shadowColor.withOpacity(0.25),
        blurRadius: 12,
        offset: const Offset(6, 6),
      )
    ],
  );
}

BoxDecoration kCustomBoxDecoration(
    double radius, Color bgColor, Color borderColor) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: borderColor),
    color: bgColor,
  );
}

SizedBox heightBox(double height){
  return SizedBox(height: height,);
}
SizedBox widthBox(double width){
  return SizedBox(height: width,);
}

Widget shimmerEffect({double? height, double? width, double radius = 12, EdgeInsetsGeometry? margin}){
  return  Shimmer.fromColors(
    baseColor: lightGreyColor,
    highlightColor: whiteColor,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: kCustomBoxDecoration(radius, whiteColor, whiteColor),
      ),
    );
}

Widget listTileItem(BuildContext context,Size size){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    height: size.height*0.15,
    width: size.width*0.45,
    decoration: kCustomBoxDecorationWithShadow(12, whiteColor, greyColor.withOpacity(0.25),blackColor),
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
            imageUrl: '',
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chicken',style: kTextStyleColor800(blackColor, 18, false),maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: true,),
                  Text('datagyuerfghfjghjzfgysgfvyjgvhvhjsgvhjvdatagyuerfghfjghjzfgysgfvyjgvhvhjsgvhjvdatagyuerfghfjghjzfgysgfvyjgvhvhjsgvhjv,shjGMVShjszvgfyutFKTcuvcgf',maxLines: 4,softWrap: true,overflow: TextOverflow.ellipsis,style: kTextStyleColor600(blackColor.withOpacity(0.5), 15, false),),
                ],
              ),
            ))
      ],
    ),
  );
}

Widget shimmerListTileEffect(BuildContext context,Size size){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    height: size.height*0.15,
    width: size.width*0.45,
    decoration: kCustomBoxDecoration(12, whiteColor, greyColor.withOpacity(0.25),),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
            baseColor: lightGreenColor,
            highlightColor: whiteColor,
            child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12)
          ),
          child: CachedNetworkImage(
            imageUrl: '',
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

        )),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                      baseColor: lightGreenColor,
                      highlightColor: whiteColor,
                      child:Container(
                          decoration: kCustomBoxDecoration(5, whiteColor, whiteColor),
                          child: Text('Chicken breeat',style: kTextStyleColor800(blackColor, 18, false),maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: true,))),
                  heightBox(5),
                  Shimmer.fromColors(
                      baseColor: lightGreenColor,
                      highlightColor: whiteColor,
                      child:Container(
                          decoration: kCustomBoxDecoration(5, whiteColor, whiteColor),
                         child: Text('datagyuerfghfjghjzfgysgfvyjgvhvhjsgvhjvdatagyuerfghfjghjzfgysgfvyjgvhvhjsgvhjvdatagyuerfghfjghjzfgysgfvyjgvhvhjsgvhjv,shjGMVShjszvgfyutFKTcuvcgf',maxLines: 3,softWrap: true,overflow: TextOverflow.ellipsis,style: kTextStyleColor600(blackColor.withOpacity(0.5), 15, false),),
                      )),
                ],
              ),
            ))
      ],
    ),
  );
}


Widget mealCategory(BuildContext context,Size size,List<MealCategoryModel> mealList){
  return GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 5, // Space between columns
    mainAxisSpacing: 5,
    childAspectRatio: 1.27,// Space between rows
    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    shrinkWrap: true,
    primary: false,
    children: List.generate(mealList.length, (index){
      return mealCategoryItem(context,size,mealList[index]);
    }),

  );
}

Widget mealCategoryItem(BuildContext context,Size size,MealCategoryModel item){
  return GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, MealsByCategoryPageScreen.rootName);
    },
    child: Container(
      decoration: kCustomBoxDecorationWithShadow(12, orangeGreyColor, orangeGreyColor,blackColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: item.strCategoryThumb??'',
            width: double.infinity,
            fit: BoxFit.cover,
            errorWidget: (context,error,imgUrl){
              return Icon(Icons.error);
            },
          ),
          Expanded(child: Text(item.strCategory??'',style: kTextStyleColor800(blackColor, 20, false),maxLines: null,))
        ],
      ),
    ),
  );
}