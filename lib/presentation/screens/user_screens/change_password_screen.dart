import 'package:flutter/material.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/login_screen.dart';
import 'package:taskmanager2/presentation/widgets/my_appbar.dart';
import 'package:taskmanager2/presentation/widgets/shadow_container.dart';
import 'package:taskmanager2/presentation/widgets/title_medium_title.dart'; // make sure this import is correct

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});
  static String name = '/change-password-screen';


  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Change Password"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPasswordField(
              label: "Type Password",
              controller: _currentPasswordController,
              obscureText: _obscureCurrent,
              toggleObscure: () {
                setState(() {
                  _obscureCurrent = !_obscureCurrent;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildPasswordField(
              label: "New Password",
              controller: _newPasswordController,
              obscureText: _obscureNew,
              toggleObscure: () {
                setState(() {
                  _obscureNew = !_obscureNew;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildPasswordField(
              label: "Confirm New Password",
              controller: _confirmPasswordController,
              obscureText: _obscureConfirm,
              toggleObscure: () {
                setState(() {
                  _obscureConfirm = !_obscureConfirm;
                });
              },
            ),
            const SizedBox(height: 30),
            FilledButton(onPressed: (){}, child: Text('Change Password'))
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback toggleObscure,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleMediumTitle(title: label),
        const SizedBox(height: 8),
        ShadowContainer(
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: '••••••••',
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: toggleObscure,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onTapChangePassword()async{

  }
}
