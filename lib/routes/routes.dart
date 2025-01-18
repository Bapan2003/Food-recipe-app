import 'package:Food/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/category/meals_by_category.dart';
import '../pages/dashboard/dashboard.dart';

class Routes{
  static Route<dynamic>? generateRoute(RouteSettings setting) {
    switch (setting.name){
      case SplashScreen.rootName:
        return getPageTransition(const SplashScreen(), setting);
      case DashboardPageScreen.rootName:
        return getPageTransition(const DashboardPageScreen(), setting);
      case MealsByCategoryPageScreen.rootName:
        return getPageTransition(const MealsByCategoryPageScreen(), setting);

    }
    return null;
  }

  static getPageTransition(dynamic screenName, RouteSettings setting) {
    return PageTransition(
        child: screenName,
        type: PageTransitionType.rightToLeft,
        alignment: Alignment.center,
        settings: setting,
        duration: const Duration(milliseconds: 750),
        maintainStateData: true,
        curve: Curves.easeInOut);
  }
}