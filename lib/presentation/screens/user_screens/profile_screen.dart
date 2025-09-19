import 'package:flutter/material.dart';
import 'package:taskmanager2/app/app_colors.dart';
import 'package:taskmanager2/controllers/auth_controller/auth_controller.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/login_screen.dart';
import 'package:taskmanager2/presentation/screens/user_screens/account_settings.dart';
import 'package:taskmanager2/presentation/screens/user_screens/my_profile.dart';
import 'package:taskmanager2/presentation/widgets/title_medium_title.dart';
import 'package:taskmanager2/utils/show_alert_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String name = '/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset('assets/images/profile_design.png',width: double.maxFinite,fit: BoxFit.cover,),
                  Positioned(
                    bottom: -50,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          padding:EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: App_colors.bgColor,
                            shape: BoxShape.circle
                          ),
                          child: CircleAvatar(
                            radius: 55,
                            backgroundImage: AssetImage("assets/images/Oval.png"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMenuItem('My Profile', Icons.person_outline,(){
                      Navigator.pushNamed(context, MyProfile.name);
                    }),
                    _buildMenuItem('Account Setting', Icons.settings_outlined,(){
                      Navigator.pushNamed(context, AccountSettings.name);
                    }),
                    const SizedBox(height: 10,),
                    TitleMediumTitle(title: "More"),
                    const SizedBox(height: 10,),
                    _buildMenuItem('Terms & Condition', Icons.description_outlined,(){}),
                    _buildMenuItem('Privacy policy', Icons.policy_outlined,(){}),
                    _buildMenuItem('Help/Support', Icons.help_outline,(){}),
                    _buildMenuItem('Log Out', Icons.logout, () async {
                      showCustomDialog(context, image: "assets/images/warning.png", title: "Warning", subtitle: "Are you sure you want to log out of your account?",onConfirm: ()async{
                        await AuthController.clearUserData();
                        showCustomDialog(context, image: 'assets/images/success.gif', title: "Success", subtitle: "You have been logged out successfully",isSuccess: true,onConfirm: (){
                          Navigator.pushNamedAndRemoveUntil( context, LoginScreen.name, (predicate) => false);
                        });
                      });

                    }),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon,VoidCallback onTap) {
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
        leading: Icon(icon, color: App_colors.brandColor),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: App_colors.brandColor),
        onTap: onTap
      ),
    );
  }
}