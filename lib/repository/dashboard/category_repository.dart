import '../../api/api_manager/api_manager.dart';
import '../../api/api_manager/api_manager_base.dart';
import '../../api/app_req/app_req_end_point.dart';
import '../../model/category/meal_by_category.dart';

class CategoryRepository{

  ApiManagerBase apiManager=ApiManager();

  Future<List<MealByCategoryModel>> getMealListByCategoryName(String strCategory) async{
    try {
      var data = await apiManager.getData(AppReqEndPoint.getMealListByCategory(strCategory));
      return (data['meals'] as List).map((e)=>MealByCategoryModel.fromJson(e)).toList();
    } on Exception {
      rethrow;
    }
  }




}