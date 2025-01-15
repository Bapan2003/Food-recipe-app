
abstract class ApiManagerBase {

  Future<Map<String,dynamic>> getData(String url);

  // Handle general internet connection check
  Future<bool> checkInternetConnection();

}