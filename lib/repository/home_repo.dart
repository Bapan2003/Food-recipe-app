import 'package:Food/api/api_manager/api_manager.dart';
import 'package:Food/api/api_manager/api_manager_base.dart';
import 'package:Food/api/app_req/app_req_end_point.dart';

class HomeRepository{

  ApiManagerBase apiManager=ApiManager();

  Future<void> getRandomMeal() async{
    try {
      var data = await apiManager.getData(AppReqEndPoint.randomMeal());
      print('Data fetched successfully: $data');
    } catch (e) {
      print('Error: $e');
    }
  }

}