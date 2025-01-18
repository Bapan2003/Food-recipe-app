import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/color.dart';
import '../../theme/text_style.dart';
import '../../theme/ui_helper.dart';

class MealsByCategoryPageScreen extends StatefulWidget {
  static const String rootName='mealsByCategory';
  const MealsByCategoryPageScreen({super.key});

  @override
  State<MealsByCategoryPageScreen> createState() => _MealsByCategoryPageScreenState();
}

class _MealsByCategoryPageScreenState extends State<MealsByCategoryPageScreen> {
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 appBar(context, 'Beef'),
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
      ),
    );
  }

  Widget appBar(BuildContext context, String title){
    return SizedBox(
      width: double.maxFinite,
      height: 72,
      // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      // margin: EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: Container(
                height: 45,
                width: 45,
                decoration: kCustomBoxDecoration(12, whiteColor, greyColor.withOpacity(0.45)),
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Image.asset('assets/images/ic_back.png'),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(title,
                style: kTextStyleColor600(blackColor, 25, true,
                    cairo: true)),
          )
        ]),
      ),
    );
  }
}
