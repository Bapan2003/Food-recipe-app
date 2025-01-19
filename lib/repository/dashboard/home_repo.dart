import 'package:Food/api/api_manager/api_manager.dart';
import 'package:Food/api/api_manager/api_manager_base.dart';
import 'package:Food/api/app_req/app_req_end_point.dart';
import 'package:Food/model/home/meal_category_model.dart';
import 'package:Food/model/home/meal_model.dart';
import 'package:Food/model/home/popular_meal_model.dart';

class HomeRepository{

  ApiManagerBase apiManager=ApiManager();

  Future<MealsModelClass> getMealList() async{
    try {
      var data = await apiManager.getData(AppReqEndPoint.randomMeal());
       return MealsModelClass.fromJson(data['meals'][0]);
    } on Exception {
      rethrow;
    }
  }

  Future<List<PopularMealModel>> getPopularMealsList() async{
    try {
      var data = await apiManager.getData(AppReqEndPoint.getPopularMeal());
      return (data['meals'] as List).map((e)=>PopularMealModel.fromJson(e)).toList();
    } on Exception {
      rethrow;
    }
  }

  Future<List<MealCategoryModel>> getCategoryMealsList() async{
    try {
      var data = await apiManager.getData(AppReqEndPoint.getCategoryMeal());
      return (data['categories'] as List).map((e)=>MealCategoryModel.fromJson(e)).toList();
    } on Exception {
      rethrow;
    }
  }


}