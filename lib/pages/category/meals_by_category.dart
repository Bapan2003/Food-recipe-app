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

}
