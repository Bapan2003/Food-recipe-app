import '../../api/api_manager/api_manager.dart';
import '../../api/api_manager/api_manager_base.dart';
import '../../api/app_req/app_req_end_point.dart';
import '../../model/home/meal_model.dart';

class SearchRepository{
  ApiManagerBase apiManager=ApiManager();

  Future<List<MealsModelClass>> getMealListBySearchKey(String searchKey) async{
    try {
      var data = await apiManager.getData(AppReqEndPoint.getMealListBySearchKey(searchKey));
      return (data['meals'] as List).map((e)=>MealsModelClass.fromJson(e)).toList();
    } on Exception {
      rethrow;
    }
  }
}