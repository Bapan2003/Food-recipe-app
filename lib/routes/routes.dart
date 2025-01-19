import 'package:Food/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/category/meals_by_category.dart';
import '../pages/dashboard/dashboard.dart';
import '../pages/details/meal_details.dart';

class Routes{
  static Route<dynamic>? generateRoute(RouteSettings setting) {
    switch (setting.name){
      case SplashScreen.rootName:
        return getPageTransition(const SplashScreen(), setting);
      case DashboardPageScreen.rootName:
        return getPageTransition(const DashboardPageScreen(), setting,pageTransitionType: PageTransitionType.fade);
      case MealsByCategoryPageScreen.rootName:
        final args= setting.arguments as String;
        return getPageTransition( MealsByCategoryPageScreen(strCategory: args,), setting);
      case MealDetailsPageScreen.rootName:
        final args= setting.arguments as String;
        return getPageTransition(MealDetailsPageScreen(id: args,), setting);

    }
    return null;
  }

  static getPageTransition(dynamic screenName, RouteSettings setting,{PageTransitionType pageTransitionType=PageTransitionType.rightToLeft}) {
    return PageTransition(
        child: screenName,
        type: pageTransitionType,
        alignment: Alignment.center,
        settings: setting,
        duration: const Duration(milliseconds: 750),
        maintainStateData: true,
        curve: Curves.easeInOut);
  }
}