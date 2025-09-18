import 'package:flutter/material.dart';
import 'package:taskmanager2/presentation/widgets/shadow_container.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({super.key});
  static String name = '/set-new-password';

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {

  TextEditingController _controller = TextEditingController();
  TextEditingController _passConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text("Set Your New Password",style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 8,),
            Text("Create a secure password to protect your account and get started seamlessly!",style: Theme.of(context).textTheme.titleSmall,),
            const SizedBox(height: 20,),
            Text("New Password",style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(height: 8,),
            ShadowContainer(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: '••••••••'
                ),

              ),
            ),const SizedBox(height: 20,),
            Text("New Confirm Password",style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(height: 8,),
            ShadowContainer(
              child: TextField(
                controller: _passConfirmController,
                decoration: InputDecoration(
                    hintText: '••••••••'
                ),

              ),
            ),
            const SizedBox(height: 70,),
            FilledButton(onPressed: (){}, child: Text("Continue")),
            Spacer()
          ],
        ),
      )),
    );
  }
}
