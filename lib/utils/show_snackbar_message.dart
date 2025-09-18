

import 'package:flutter/material.dart';
import 'package:taskmanager2/app/app_colors.dart';

void showSnackBarMessage(BuildContext context,String content,{bool isError = true}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content),backgroundColor: isError?Colors.red:App_colors.brandColor,),
  );
}