import 'package:flutter/material.dart';
import 'package:taskmanager2/app/app_colors.dart';
import 'package:taskmanager2/presentation/screens/user_screens/change_password_screen.dart';
import 'package:taskmanager2/presentation/widgets/my_appbar.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});
  static String name = '/account-setting-screen';


  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Account Setting'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _buildMenuItem('Change Password', Icons.lock, (){
              Navigator.pushNamed(context, ChangePasswordScreen.name);
            }, App_colors.brandColor, Colors.black),
            _buildMenuItem('Delete Account', Icons.lock, (){}, Colors.red, Colors.red),
          ],
        ),
      ),
    );
  }
  Widget _buildMenuItem(String title, IconData icon,VoidCallback onTap,Color iconColor,Color textColor) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black12,blurRadius: 5)
          ]
      ),
      child: ListTile(
          leading: Icon(icon, color: iconColor),
          title: Text(
            title,
            style: TextStyle(fontSize: 16,color: textColor),
          ),
          onTap: onTap,
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: iconColor),

      ),
    );
  }

}
