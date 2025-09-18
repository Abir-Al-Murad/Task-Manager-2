import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "My Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Task",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
