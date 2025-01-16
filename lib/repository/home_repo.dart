import 'package:Food/api/api_manager/api_manager.dart';
import 'package:Food/api/api_manager/api_manager_base.dart';
import 'package:Food/api/app_req/app_req_end_point.dart';
import 'package:Food/model/home/meal_model.dart';

class HomeRepository{

  ApiManagerBase apiManager=ApiManager();

  Future<List<MealsModelClass>> getMealList() async{
    try {
      var data = await apiManager.getData(AppReqEndPoint.randomMeal());
       return (data['meals'] as List).map((e)=>MealsModelClass.fromJson(e)).toList();
    } on Exception {
      rethrow;
    }
  }

}