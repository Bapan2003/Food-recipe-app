import 'package:Food/api/app_env/app_env.dart';

class AppReqEndPoint{

  static String randomMeal(){
    return '${AppEnv.instance.baseUrl}/random.php';
  }


}