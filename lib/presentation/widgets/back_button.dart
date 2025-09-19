import 'package:flutter/material.dart';
import 'package:taskmanager2/app/app_colors.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    super.key,
    this.onTap,
    this.editButton = false,
  });
  final editButton;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 0.2),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: editButton?Icon(Icons.edit,color: App_colors.brandColor,size: 25,): Icon(Icons.arrow_back_ios, color: App_colors.brandColor, size: 25),
          ),
        ),
      ),
    );
  }
}
