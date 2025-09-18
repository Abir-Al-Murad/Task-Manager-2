import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taskmanager2/controllers/sign_up_controller.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/login_screen.dart';
import 'package:taskmanager2/presentation/widgets/shadow_container.dart';
import 'package:taskmanager2/presentation/widgets/title_medium_title.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String name = '/sign-up-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final SignUpContoller _contoller = Get.put(SignUpContoller());

  bool isCheck = false;

  void _onTapLogIn() {
    // Navigate to Login screen
    print("Log In tapped");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    "Create Your Account",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Join Task Manager today - organize better, work smarter, and stay in control of your day.',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 20),

                  TitleMediumTitle(title: "First Name"),
                  const SizedBox(height: 8),
                  ShadowContainer(
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        hintText: "e.g. Kristin",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "First name is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  TitleMediumTitle(title: "Last Name"),
                  const SizedBox(height: 8),
                  ShadowContainer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "e.g. Cooper",
                        errorMaxLines: 2
                      ),
                      controller: _lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Last name is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  TitleMediumTitle(title: "Email Address"),
                  const SizedBox(height: 8),
                  ShadowContainer(
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "e.g. kristin.cooper@example.com",
                      ),
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

                  TitleMediumTitle(title: "Address"),
                  const SizedBox(height: 8),
                  ShadowContainer(
                    child: TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        hintText: "e.g. 1234 Elm Street, Springfield, IL",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Address is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  TitleMediumTitle(title: "Password"),
                  const SizedBox(height: 8),
                  ShadowContainer(
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: '••••••••',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  TitleMediumTitle(title: "Confirm Password"),
                  const SizedBox(height: 8),
                  ShadowContainer(
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: '••••••••',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Confirm your password";
                        }
                        if (value != _passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),

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
                      const Text("Agree to Terms & Conditions"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: Divider(thickness: 3)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('OR', style: Theme.of(context).textTheme.titleMedium),
                      ),
                      Expanded(child: Divider(thickness: 3)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // RichText for Log In
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Log In',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = _onTapLogIn,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  GetBuilder<SignUpContoller>(
                    builder: (cotroller) {
                      return Visibility(
                        visible: cotroller.inProgress == false,
                        replacement: Center(child: CircularProgressIndicator()),
                        child: FilledButton(
                          onPressed: _onSubmit,
                          child: const Text("Sign Up"),
                        ),
                      );
                    }
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _onSubmit() async{
    if (_formKey.currentState!.validate()) {
      if (!isCheck) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please agree to terms")),
        );
        return;
      }
      final bool result = await _contoller.singUp(_emailController.text.trim(), _passwordController.text, _firstNameController.text.trim(), _lastNameController.text.trim(),_addressController.text.trim());
      print(result);
      if(result){
        _clearTextFields();
        Navigator.pushNamed(context, LoginScreen.name);
      }
    }else{
      print("Not Validate");
    }
  }

  void _clearTextFields(){
    _addressController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

}
