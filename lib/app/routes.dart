
import 'package:flutter/material.dart';
import 'package:taskmanager2/models/task_model.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/login_screen.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/set_new_password.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/sign_up_screen.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/verify_email.dart';
import 'package:taskmanager2/presentation/screens/user_screens/account_settings.dart';
import 'package:taskmanager2/presentation/screens/user_screens/add_task_screen.dart';
import 'package:taskmanager2/presentation/screens/user_screens/change_password_screen.dart';
import 'package:taskmanager2/presentation/screens/user_screens/my_profile.dart';
import 'package:taskmanager2/presentation/screens/user_screens/my_tasks_screen.dart';
import 'package:taskmanager2/presentation/screens/user_screens/profile_screen.dart';
import 'package:taskmanager2/presentation/screens/user_screens/tasks_details.dart';
import 'package:taskmanager2/widget_tree.dart';

MaterialPageRoute onGenerateRoute(RouteSettings settings){
  late Widget screen;
  if(settings.name == LoginScreen.name){
    screen = LoginScreen();
  }else if(settings.name == SignUpScreen.name){
    screen = SignUpScreen();
  }else if(settings.name == VerifyEmail.name){
    screen = VerifyEmail();
  }else if(settings.name == SetNewPassword.name){
    screen = SetNewPassword();
  }else if(settings.name == MyTasksScreen.name){
    screen = MyTasksScreen();
  }else if(settings.name == WidgetTree.name){
    screen = WidgetTree();
  }else if(settings.name == AddTaskScreen.name){
    screen = AddTaskScreen();
  }else if(settings.name == ProfileScreen.name){
    screen = ProfileScreen();
  }else if(settings.name == MyProfile.name){
    screen = MyProfile();
  }else if(settings.name == AccountSettings.name){
    screen = AccountSettings();
  }else if(settings.name == ChangePasswordScreen.name){
    screen = ChangePasswordScreen();
  } else if(settings.name == TasksDetails.name){
    final Task args = settings.arguments as Task;
    screen = TasksDetails(task: args,);
  }

  return MaterialPageRoute(builder: (ctx)=>screen);
}