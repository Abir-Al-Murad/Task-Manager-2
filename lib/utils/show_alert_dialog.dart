import 'package:flutter/material.dart';
import 'package:taskmanager2/app/app_colors.dart';
import 'package:taskmanager2/controllers/auth_controller/auth_controller.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/login_screen.dart';

void showCustomDialog(
    BuildContext context, {
      required String image,
      required String title,
      required String subtitle,
      bool isSuccess = false,
      VoidCallback? onConfirm,
    }) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 300,
          maxHeight: 300,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                height: 80,
                width: 80,
                child: Image.asset(image)),
            SizedBox(height: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: isSuccess
          ? [
        SizedBox(
          width: 100,
          child: FilledButton(
            onPressed: onConfirm ??
                    () {
                  Navigator.pop(context);
                },
            child: Text("Done"),
          ),
        ),
      ]
          : [
        SizedBox(
          width: 100,
          child: FilledButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: App_colors.brandColor),
            ),
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: App_colors.brandColor),
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 100,
          child: FilledButton(
            onPressed: onConfirm ??
                    () async {
                  await AuthController.clearUserData();
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.name, (predicate) => false);
                },
            child: Text("Confirm"),
          ),
        ),
      ],
    ),
  );
}
