import 'package:flutter/material.dart';
import 'package:taskmanager2/app/app_colors.dart';
import 'package:taskmanager2/controllers/auth_controller/auth_controller.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});
  static String name = '/my-profile';

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/person.png'), // add your image
                      ),
                      const SizedBox(height: 10),
                      Text(
                        AuthController.Profile?.firstName??"Unknown",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                _buildMenuItem("${AuthController.Profile?.firstName} ${AuthController.Profile?.lastName}", Icons.person),
                _buildMenuItem(AuthController.email??"", Icons.alternate_email),
                _buildMenuItem(AuthController.Profile?.address??' ', Icons.location_on),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: App_colors.brandColor),
          const SizedBox(width: 5),
          Text(
            '|',
            style: TextStyle(
              color: App_colors.brandColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }


}
