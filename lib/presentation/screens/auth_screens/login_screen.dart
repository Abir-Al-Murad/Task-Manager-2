import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taskmanager2/controllers/login_controller.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/sign_up_screen.dart';
import 'package:taskmanager2/presentation/screens/user_screens/my_tasks_screen.dart';
import 'package:taskmanager2/presentation/widgets/shadow_container.dart';
import 'package:taskmanager2/presentation/widgets/title_medium_title.dart';
import 'package:taskmanager2/utils/show_loading.dart';
import 'package:taskmanager2/utils/show_snackbar_message.dart';
import 'package:taskmanager2/widget_tree.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String name = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController(text: "rakibbro@yopmail.com");
  final _passwordController = TextEditingController(text: "123456");
  final LoginController _controller = Get.put(LoginController());
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  "Welcome Back!",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5,),
                Text(
                  "Stay productive and take control of your tasks.",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 20),
                Text("Email Address",style: Theme.of(context).textTheme.titleMedium,),
                const SizedBox(height: 8,),

                ShadowContainer(
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: "michelle.rivera@example.com",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),

                TitleMediumTitle(title: 'PassWord',),
                const SizedBox(height: 8,),
                ShadowContainer(
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '••••••••',
                      suffixIcon: Icon(CupertinoIcons.eye_slash),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 2,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        value: isCheck,
                        onChanged: (value) {
                          setState(() {
                            isCheck = value!;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    const Text("Remember me"),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(child: Divider(
                      thickness: 3,
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('OR',style: Theme.of(context).textTheme.titleMedium,),
                    ),
                    Expanded(child: Divider(
                      thickness: 3,
                    )),
                  ],
                ),
                const SizedBox(height: 20),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      // Optional: make it clickable
                      recognizer: TapGestureRecognizer()..onTap = (){
                        _onTapSignUp();
                      },
                    ),
                  ],
                ),
              ),
                const SizedBox(height: 20),
                GetBuilder<LoginController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.inProgress == false,
                        // replacement: ,
                        child: FilledButton(onPressed: _onTapSign, child: Text("Log In")));
                  }
                ),
                Spacer(),

              ],
            ),
          ),
        ),
      ),
    );
  }
  void _onTapSignUp(){
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  void _onTapSign()async{
    showLoading(context);
    bool isSuccess = await _controller.logIn(_emailController.text.trim(), _passwordController.text);
    if(isSuccess){
      Navigator.pushNamedAndRemoveUntil(context, WidgetTree.name, (predicate)=>false);

    }else{
      hideLoading(context);
      showSnackBarMessage(context, _controller.errorMessage??"Error");
    }
  }
}



