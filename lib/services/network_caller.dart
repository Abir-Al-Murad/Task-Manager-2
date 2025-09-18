import 'dart:convert';

import 'package:http/http.dart';
import 'package:taskmanager2/controllers/auth_controller/auth_controller.dart';

class NetworkResponse{
  final int statusCode;
  final Map<String,dynamic>? body;
  final bool isSuccess;
  final String? errorMessage;
  NetworkResponse({required this.statusCode , required this.isSuccess, this.body,this.errorMessage});
}


class NetworkCaller {
  static Future<NetworkResponse> postFormData({
    required String url,
    required Map<String, String> fields,
    MultipartFile? file,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      var request = MultipartRequest('POST', uri);

      request.fields.addAll(fields);


      var streamedResponse = await request.send();
      var response = await Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } catch (e) {
      return NetworkResponse(
          statusCode: -1, isSuccess: false, errorMessage: 'Something wrong');
    }
  }

  static Future<NetworkResponse> getRequest(String url)async{
    try {
      Uri uri = Uri.parse(url);
      Map<String,String> header = {
        'Authorization':"Bearer ${AuthController.accessToken}"
      };

      Response response = await get(uri,headers: header);
      print(response.body);
      return _handleResponse(response);
    }catch (e) {
      return NetworkResponse(statusCode: -1, isSuccess: false,errorMessage: "An Error Occur");
    }
  }

  static Future<NetworkResponse> jsonPostRequest(String url,Map<String,String> body,{bool authHead = false})async{
    try {
      Uri uri = Uri.parse(url);
      print(uri);
      Response response = await post(uri,body: jsonEncode(body),headers: authHead?{
        "content-type":"application/json",
      'Authorization':"Bearer ${AuthController.accessToken}"
      }:{
        "content-type":"application/json"
      });
      return _handleResponse(response);
    }catch (e) {
      return NetworkResponse(statusCode: -1, isSuccess: false);
    }
  }

  static NetworkResponse _handleResponse(Response response) {
    try {
      final decodedJson = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            body: decodedJson);
      } else {
        final errorMsg = decodedJson['error'];
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: false,
            errorMessage: errorMsg);
      }
    } catch (e) {
      return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: "Something Wrong");
    }
  }
}
