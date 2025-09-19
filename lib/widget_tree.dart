import 'package:flutter/material.dart';
import 'package:taskmanager2/app/app_colors.dart';
import 'package:taskmanager2/presentation/screens/user_screens/add_task_screen.dart';
import 'package:taskmanager2/presentation/screens/user_screens/my_tasks_screen.dart';
import 'package:taskmanager2/presentation/screens/user_screens/profile_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});
  static String name = '/widget-tree';

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  List<Widget> screens = [
    MyTasksScreen(),
    AddTaskScreen(),
    ProfileScreen(),
  ];

  int _selectedIndex = 0;

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (!isSelected)
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          // Icon part
          Container(
            height: isSelected ? 80 : 24,
            width: isSelected ? 80 : 24,
            decoration: isSelected
                ? BoxDecoration(
              color: App_colors.brandColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(-1, -5),
                  blurRadius: 1,
                )
              ]

            )
                : null,
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
              size: isSelected ? 28 : 24,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCustomBottomNav() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, -2),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(3, (index) {
              IconData icon;
              String label;
              switch (index) {
                case 0:
                  icon = Icons.home_outlined;
                  label = "My Tasks";
                  break;
                case 1:
                  icon = Icons.add;
                  label = "Add Task";
                  break;
                default:
                  icon = Icons.person_outline;
                  label = "Profile";
              }
              return Transform.translate(
                offset: Offset(0, _selectedIndex == index ? -20 : 0),
                child: _buildNavItem(icon, label, index),
              );
            }),
          ),
        ),
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: _buildCustomBottomNav(),
    );
  }
}
