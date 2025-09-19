import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager2/controllers/auth_controller/auth_controller.dart';
import 'package:taskmanager2/presentation/screens/page_view_screens/page_view_screen.dart';
import 'package:taskmanager2/widget_tree.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String name = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    wait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/splash.png',
            height: 102,
            width: 130,
          ),
        ),
      ),
    );
  }

  void checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");
    if (token != null) {
      AuthController.accessToken = token;
      Navigator.pushReplacementNamed(context, WidgetTree.name);
    } else {
      await prefs.remove("accessToken");
      Navigator.pushNamedAndRemoveUntil(
        context,
        PageViewScreen.name,
        (predicate) => false,
      );
    }
  }

  Future<void> wait() async {
    await Future.delayed(Duration(seconds: 3));
    checkLogin();
  }
}
