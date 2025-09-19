import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:taskmanager2/app/app_colors.dart';
import 'package:taskmanager2/controllers/auth_controller/auth_controller.dart';
import 'package:taskmanager2/models/task_model.dart';
import 'package:taskmanager2/presentation/screens/user_screens/edit_task_screen.dart';
import 'package:taskmanager2/presentation/widgets/my_appbar.dart';
import 'package:taskmanager2/presentation/widgets/title_medium_title.dart';
import 'package:taskmanager2/services/urls.dart';
import 'package:taskmanager2/utils/show_loading.dart';

class TasksDetails extends StatefulWidget {
  const TasksDetails({super.key,required this.task});
  static String name = '/tasks-details';
  final Task task;

  @override
  State<TasksDetails> createState() => _TasksDetailsState();
}

class _TasksDetailsState extends State<TasksDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Tasks Details'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildRow(context, "Task Title", widget.task.title, Icons.task_alt_outlined),
                  SizedBox(height: 20,),

                  Divider(
                    color: App_colors.brandColor,
                    thickness: 0.5,
                  ),
                  SizedBox(height: 20,),

                  buildRow(context, "Task Description", widget.task.description, Icons.description_outlined),
                  SizedBox(height: 20,),

                  Divider(
                    color: App_colors.brandColor,
                    thickness: 0.5,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildContainer("Delete Task",Colors.redAccent,Icons.delete,(){
                              _onDelete();
                      }),
                      SizedBox(width: 10,),
                      buildContainer("Edit Task", App_colors.brandColor, Icons.task_sharp, (){
                        _onTapEdit();
                      }),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget buildRow(BuildContext context,String title,String details,IconData icon) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon,color: App_colors.brandColor,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleMediumTitle(title: title),
                  Text(details,style: Theme.of(context).textTheme.titleSmall,),
                ],
              ),
            ],
          );
  }

  Widget buildContainer(String title,Color color,IconData icon,VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color)
        ),
                  child:Row(
                    children: [
                      Icon(icon,color:color,),
                      SizedBox(width: 3,),
                      TitleMediumTitle(title: title),
                    ],
                  ),
                ),
    );
  }
  
  Future<void> _onDelete()async{
    //showDialog here
    showLoading(context);
    Uri uri = Uri.parse(Urls.deleteTask(widget.task.id));
    Response response = await delete(uri,headers: {
      "Authorization": "Bearer ${AuthController.accessToken}",
      "Content-Type": "application/json",
    },);

    if(response.statusCode ==200){
      Navigator.pop(context);
    }
    hideLoading(context);

  }

  void _onTapEdit(){
    Navigator.pushNamed(context, EditTaskScreen.name);
  }
}
