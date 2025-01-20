import 'package:Food/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/category/meals_by_category.dart';
import '../pages/dashboard/dashboard.dart';
import '../pages/details/meal_details.dart';
import '../pages/search/search_screen.dart';

class Routes{
  static Route<dynamic>? generateRoute(RouteSettings setting) {
    switch (setting.name){
      case SplashScreen.rootName:
        return getPageTransition(const SplashScreen(), setting);
      case DashboardPageScreen.rootName:
        return getPageTransition(const DashboardPageScreen(), setting,pageTransitionType: PageTransitionType.fade);
      case SearchPageScreen.rootName:
        return getPageTransition(const SearchPageScreen(), setting,pageTransitionType: PageTransitionType.fade,milliSeconds: 100);
      case MealsByCategoryPageScreen.rootName:
        final args= setting.arguments as String;
        return getPageTransition( MealsByCategoryPageScreen(strCategory: args,), setting);
      case MealDetailsPageScreen.rootName:
        final args= setting.arguments as String;
        return getPageTransition(MealDetailsPageScreen(id: args,), setting);

    }
    return null;
  }

  static getPageTransition(dynamic screenName, RouteSettings setting,{PageTransitionType pageTransitionType=PageTransitionType.rightToLeft,int milliSeconds=750}) {
    return PageTransition(
        child: screenName,
        type: pageTransitionType,
        alignment: Alignment.center,
        settings: setting,
        duration:  Duration(milliseconds: milliSeconds),
        maintainStateData: true,
        curve: Curves.easeInOut);
  }
}