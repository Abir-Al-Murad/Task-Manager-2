import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanager2/controllers/auth_controller/auth_controller.dart';
import 'package:taskmanager2/models/task_model.dart';
import 'package:taskmanager2/presentation/screens/user_screens/tasks_details.dart';
import 'package:taskmanager2/services/network_caller.dart';
import 'package:taskmanager2/services/urls.dart';

class MyTasksScreen extends StatefulWidget {
  const MyTasksScreen({super.key});
  static String name = '/my-tasks';

  @override
  State<MyTasksScreen> createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {
  final List<Task> allTasks = [];
  int count = 0 ;
  bool isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      getAllTask();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(AuthController.accessToken);
    return Scaffold(
      body: SafeArea(
        child: isLoading?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                Container(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AuthController.Profile?.image != null && AuthController.Profile!.image.isNotEmpty
                            ? NetworkImage(AuthController.Profile!.image)
                            : AssetImage('assets/images/person.png'),
                        radius: 30,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AuthController.Profile?.firstName??"Unknown",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "Welcome to Task Manager",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

               const SizedBox(height: 20,),
                Text("My Tasks",style:Theme.of(context)
                    .textTheme
                    .titleLarge?.copyWith(fontSize:18)),
                const SizedBox(height: 10,),

                ListView.builder(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: count,
                    itemBuilder: (context,index){
                      final singleTask = allTasks[index];
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, TasksDetails.name,arguments: singleTask);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 1
                                )
                              ]
                            ),
                            child: Stack(children:[
                                Image.asset('assets/images/containerBG.png'),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset('assets/images/Frame.svg'),
                                        const SizedBox(height: 10,),
                                        Text(singleTask.title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                                        const SizedBox(height: 10,),
                                        Text(singleTask.description,style: Theme.of(context).textTheme.titleSmall,)
                                      ],
                                    ),
                                  ),
                                )

                            ] ,
                          ),
                          ),
                        ),
                       const SizedBox(height: 8,),
                      ],
                    );
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getAllTask()async{
    NetworkResponse response = await NetworkCaller.getRequest(Urls.allTask);
    final int  taskcount = response.body?['data']['count']??0;
    count  = taskcount;
    final List list = response.body?['data']['myTasks']??[];
    List<Task> taskList = list.map((e)=>Task.fromJson(e)).toList();
    allTasks.addAll(taskList);
    isLoading = false;
    setState(() {
    });
  }
}
