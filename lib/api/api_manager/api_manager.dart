import 'dart:convert';
import 'dart:io';

import 'package:Food/api/api_manager/api_manager_base.dart';
import 'package:Food/utility/app_helper.dart';
import 'package:http/http.dart' as http;

class ApiManager extends ApiManagerBase{
  @override
  Future<Map<String, dynamic>> getData(String url) async {
    bool isConnected = await checkInternetConnection();
    if (!isConnected) {
      throw Exception('No internet connection');
    }

    var client = http.Client();
    try {
      final response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        // Throw an exception for non-200 status codes
        throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Network error occurred');
    } on FormatException {
      throw Exception('Invalid JSON format');
    } on Exception catch (e) {
      throw Exception('An unexpected error occurred: $e');
    } finally {
      client.close();
    }
  }
  @override
  Future<bool> checkInternetConnection() async{
   return await AppHelper.checkInternetConnection();
  }

}