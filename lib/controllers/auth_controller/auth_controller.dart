import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager2/models/UserProfile.dart';

class AuthController {
  static String? email;
  static String? accessToken;
  static UserProfile? Profile;

  static Future<void> saveUserData(String mail,String Token,UserProfile profile)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('email', mail);
    await sharedPreferences.setString('accessToken', Token);
    await sharedPreferences.setString('userProfile', jsonEncode(profile.toJson()));
    email = mail;
    print("Your token:");
    accessToken = Token;
    Profile = profile;
    print("Your Access token saved : $accessToken");
    print(profile.firstName);
  }

  static Future<void> getUserData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = await sharedPreferences.getString('accessToken');
    final mail = await sharedPreferences.getString('email');
    final user = await sharedPreferences.getString('profile');
    if (token !=null && mail !=null && user!=null) {
      email = mail;
      accessToken = token;
      Profile= jsonDecode(user);
    }else{
      email = null;
      accessToken = null;
      Profile = null;
    }
  }
}