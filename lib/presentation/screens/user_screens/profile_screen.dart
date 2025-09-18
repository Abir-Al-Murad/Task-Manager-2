import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanager2/app/app_colors.dart';
import 'package:taskmanager2/controllers/auth_controller/auth_controller.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/login_screen.dart';
import 'package:taskmanager2/presentation/screens/user_screens/account_settings.dart';
import 'package:taskmanager2/presentation/screens/user_screens/my_profile.dart';
import 'package:taskmanager2/presentation/widgets/title_medium_title.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey,
                  height: 300,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -240,
                        left: -105,
                        child: SvgPicture.asset('assets/images/profile_design.svg'),
                      ),
                      Positioned(
                        top: 129,
                        left: 145,
                        child: SvgPicture.asset('assets/images/Oval.svg'),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey[200],
                              child: Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              AuthController.Profile?.firstName??"Unknown",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'john.doe@example.com',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          
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
                _buildMenuItem('Log Out', Icons.logout,(){}),
              ],
            ),
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