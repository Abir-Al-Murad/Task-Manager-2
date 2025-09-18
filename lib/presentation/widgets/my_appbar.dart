import 'package:flutter/material.dart';
import 'package:taskmanager2/presentation/widgets/back_button.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MyAppBar({
    super.key,
    required this.title
  });
  final String title;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: MyBackButton(),
      title: Text(title,style: Theme.of(context).textTheme.titleMedium,),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
