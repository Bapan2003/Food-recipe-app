import 'package:Food/api/app_env/app_env.dart';

class AppReqEndPoint{

  static String randomMeal(){
    return '${AppEnv.instance.baseUrl}/random.php';
  }


  static String getPopularMeal(){
    return '${AppEnv.instance.baseUrl}/filter.php?a=Indian';
  }

  static String getCategoryMeal(){
    return '${AppEnv.instance.baseUrl}/categories.php';
  }

  static String getMealDetailsById(String id){
    return '${AppEnv.instance.baseUrl}/lookup.php?i=$id';
  }

  static String getMealListByCategory(String categoryName){
    return '${AppEnv.instance.baseUrl}/filter.php?c=$categoryName';
  }


  static String getMealListBySearchKey(String searchKey){
    return '${AppEnv.instance.baseUrl}/search.php?s=$searchKey';
  }

}