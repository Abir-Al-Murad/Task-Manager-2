import 'package:flutter/material.dart';
import 'package:taskmanager2/presentation/screens/auth_screens/login_screen.dart';
import 'package:taskmanager2/presentation/widgets/back_button.dart';
import 'package:taskmanager2/presentation/widgets/my_appbar.dart';
import 'package:taskmanager2/presentation/widgets/shadow_container.dart';
import 'package:taskmanager2/presentation/widgets/title_medium_title.dart';
import 'package:taskmanager2/services/network_caller.dart';
import 'package:taskmanager2/services/urls.dart';
import 'package:taskmanager2/utils/show_loading.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  static String name = '/add_task-screen';


  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Add Task',),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            TitleMediumTitle(title: 'Task Title'),
            const SizedBox(height: 5,),
            ShadowContainer(child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'e.g. Design Landing Page Header'
              ),
            )),
            const SizedBox(height: 25,),
            TitleMediumTitle(title: 'Description'),
            const SizedBox(height: 5,),
            ShadowContainer(child: TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: 'e.g. Include logo, navigation, and CTA button with brand color',
              ),
            )),
            const SizedBox(height: 25,),
            FilledButton(onPressed: (){
              addTask();
            }, child: Text("Save Task"))

          ],
        ),
      ),
    );
  }

  Future<void> addTask()async{
    showLoading(context);
    Map<String,String>requestBody={
      'title':_titleController.text.trim(),
      'description':_descriptionController.text.trim(),
    };
    NetworkResponse response = await NetworkCaller.jsonPostRequest(Urls.addTask,requestBody,authHead: true);
    print(response.statusCode);
    if(response.isSuccess){
      _titleController.clear();
      _descriptionController.clear();
    }else{
      print(response.body);
    }
    hideLoading(context);
  }
}

