import '../../api/api_manager/api_manager.dart';
import '../../api/api_manager/api_manager_base.dart';
import '../../api/app_req/app_req_end_point.dart';
import '../../model/home/meal_model.dart';

class MealDetailsRepository{
  ApiManagerBase apiManager=ApiManager();

  Future<MealsModelClass> getMealDetailsById(String id) async{
    try {
      var data = await apiManager.getData(AppReqEndPoint.getMealDetailsById(id));
      return MealsModelClass.fromJson(data['meals'][0]);
    } on Exception {
      rethrow;
    }
  }

}