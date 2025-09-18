import 'dart:convert';

import 'package:get/get.dart';
import 'package:taskmanager2/controllers/auth_controller/auth_controller.dart';
import 'package:taskmanager2/models/UserProfile.dart';
import 'package:taskmanager2/services/network_caller.dart';
import 'package:taskmanager2/services/urls.dart';

class LoginController extends GetxController{
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> logIn(String email,String password)async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String,String>requestbody = {
      'email':email,
      'password':password,
    };
    NetworkResponse response = await  NetworkCaller.jsonPostRequest(Urls.loginUrl,requestbody );
    if(response.isSuccess){
      isSuccess = true;
      final UserProfile profile = UserProfile.fromJson(response.body?['data']['user']);
      print(response.body);
      print(response.body!['data']['token']);
      final token = response.body!['data']['token'];
      await AuthController.saveUserData(email, token,profile);

    }else{

      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}