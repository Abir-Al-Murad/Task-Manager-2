import 'dart:convert';

import 'package:get/get.dart';
import 'package:taskmanager2/controllers/auth_controller/auth_controller.dart';
import 'package:taskmanager2/models/UserProfile.dart';
import 'package:taskmanager2/services/network_caller.dart';
import 'package:taskmanager2/services/urls.dart';

class LoginController extends GetxController{
  bool _inProgress = false;
  String? _errorMessage;
  String? _token;
  UserProfile? _user;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  String? get token => _token;
  UserProfile? get user => _user;

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
      _user = UserProfile.fromJson(response.body?['data']['user']);
      print("Your address ${_user?.address}");
      print(response.body);
      print(response.body!['data']['token']);
      _token = response.body!['data']['token'];

    }else{

      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}