import 'package:flutter/material.dart';
import 'package:taskmanager2/presentation/widgets/shadow_container.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});
  static String name = 'verify-email';

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text("Verify Your Email",style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 8,),
            Text("We'll send a verification code to this email to confirm your account",style: Theme.of(context).textTheme.titleSmall,),
            const SizedBox(height: 20,),
            Text("Email Address",style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(height: 8,),
            ShadowContainer(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'michelle.rivera@emaple.com'
                ),
              
              ),
            ),
            const SizedBox(height: 70,),
            FilledButton(onPressed: (){}, child: Text("Send")),
            Spacer()
          ],
        ),
      )),
    );
  }
}
