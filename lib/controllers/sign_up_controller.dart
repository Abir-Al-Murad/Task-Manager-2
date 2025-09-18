import 'package:get/get.dart';
import 'package:taskmanager2/services/network_caller.dart';
import 'package:taskmanager2/services/urls.dart';

class SignUpContoller extends GetxController{
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> singUp(String email,String password, String firstname,String lastname,String address)async{
    bool isSuccess = false;
    Map<String,String> requestBody = {
      'firstName':firstname,
      'lastName':lastname,
      'email':email,
      'password':password,
    };
    print(requestBody);

    NetworkResponse response =await NetworkCaller.postFormData(url: Urls.registerUrl, fields: requestBody);
    print(response.statusCode);
    if(response.isSuccess){
      _errorMessage = null;
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}