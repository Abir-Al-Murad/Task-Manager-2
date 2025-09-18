import 'package:flutter/material.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/login_screen.dart';
import 'package:taskmanager2/presentation/widgets/back_button.dart';
import 'package:taskmanager2/presentation/widgets/my_appbar.dart';
import 'package:taskmanager2/presentation/widgets/shadow_container.dart';
import 'package:taskmanager2/presentation/widgets/title_medium_title.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});
  static String name = '/edit-task-screen';


  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Edit Task',),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            TitleMediumTitle(title: 'Task Title'),
            const SizedBox(height: 5,),
            ShadowContainer(child: TextField(
              decoration: InputDecoration(
                  hintText: 'e.g. Design Landing Page Header'
              ),
            )),
            const SizedBox(height: 25,),
            TitleMediumTitle(title: 'Description'),
            const SizedBox(height: 5,),
            ShadowContainer(child: TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'e.g. Include logo, navigation, and CTA button with brand color',
              ),
            )),
            const SizedBox(height: 25,),
            FilledButton(onPressed: (){}, child: Text("Update Task"))

          ],
        ),
      ),
    );
  }
}

