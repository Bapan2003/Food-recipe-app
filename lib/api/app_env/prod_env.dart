import 'package:Food/api/app_env/app_env.dart';

class ProdEnv implements AppEnv{


  @override
  String get baseUrl => 'https://www.themealdb.com/api/json/v1/1';

  @override
  String get environmentName => 'Production';

}