import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/home/meal_model.dart';
import 'app_constant.dart';

class AppSettings{

  static Future<void> saveFavorites(List<MealsModelClass> meals) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = json.encode(meals.map((meal) => meal.toJson()).toList());
    await prefs.setString(kFavouritesMeal, encodedData);
  }

  static Future<List<MealsModelClass>> getAllFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteMealsJsonString = prefs.getString(kFavouritesMeal);
    if (favoriteMealsJsonString != null) {
      final List<dynamic> decodedList = json.decode(favoriteMealsJsonString);
      return decodedList.map((json) => MealsModelClass.fromJson(json)).toList();
    }
    return [];
  }
}