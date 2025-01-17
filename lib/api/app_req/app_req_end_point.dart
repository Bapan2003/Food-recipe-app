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
}