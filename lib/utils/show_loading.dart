

import 'package:flutter/material.dart';
import 'package:taskmanager2/app/app_colors.dart';

void showLoading(BuildContext context){
  showDialog(
      barrierDismissible: false,
      context: context, builder: (_){
    return Center(
      child: CircularProgressIndicator(
        color: App_colors.brandColor,
      ),
    );
  });
}

void hideLoading(BuildContext context) {
  Navigator.of(context,rootNavigator: true).pop();
}