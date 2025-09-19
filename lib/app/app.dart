import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager2/app/app_colors.dart';
import 'package:taskmanager2/app/routes.dart';
import 'package:taskmanager2/controller_binder.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/login_screen.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/sign_up_screen.dart';
import 'package:taskmanager2/presentation/screens/user_screens/add_task_screen.dart';
import 'package:taskmanager2/presentation/screens/user_screens/my_tasks_screen.dart';
import 'package:taskmanager2/presentation/screens/user_screens/profile_screen.dart';
import 'package:taskmanager2/presentation/screens/user_screens/splash_screen.dart';
import 'package:taskmanager2/widget_tree.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      ).copyWith(
        titleLarge: GoogleFonts.poppins(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: GoogleFonts.poppins(
            fontSize: 14,fontWeight: FontWeight.w400,color: App_colors.themegrey,
        ),
        titleMedium: GoogleFonts.poppins(
            fontSize: 14,fontWeight: FontWeight.w600,
        ),
      ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            padding: EdgeInsets.all(10),
            minimumSize: Size(double.maxFinite, 50),
            backgroundColor: App_colors.brandColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          )
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          side: BorderSide(color: Colors.green, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        scaffoldBackgroundColor: App_colors.bgColor,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),
        appBarTheme: AppBarTheme(
          leadingWidth: 90,
          titleSpacing: 0,
          toolbarHeight: 70,
          color: App_colors.bgColor
        ),
      ),
      initialRoute: SplashScreen.name,
      onGenerateRoute: onGenerateRoute,
      initialBinding: ControllerBinder(),
      home:  SplashScreen(),
    );
  }
}
