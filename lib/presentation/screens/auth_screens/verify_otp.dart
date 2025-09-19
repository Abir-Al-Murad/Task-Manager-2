import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager2/app/app_colors.dart';
import 'package:taskmanager2/services/network_caller.dart';
import 'package:taskmanager2/services/urls.dart';
import 'package:taskmanager2/utils/show_loading.dart';
import 'package:taskmanager2/utils/show_snackbar_message.dart';
import 'package:taskmanager2/widget_tree.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key,required this.email});
  static String name = 'verify-otp';
  final String email;

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {

  TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Text("6-digit code",style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 8,),
            Text("Please enter the code we've sent to ${widget.email}",style: Theme.of(context).textTheme.titleSmall,),
            const SizedBox(height: 20,),
            PinCodeTextField(
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              boxShadows: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  spreadRadius: 1
                )
              ],
              pinTheme: PinTheme(
                inactiveColor: Colors.white,
                inactiveFillColor: Colors.white,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                activeColor: Colors.green,
                selectedColor: App_colors.brandColor,
              ),
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: true,
              controller: _otpController,
              onCompleted: (v) {
                print("Completed");
              },
              appContext: context,
            ),
            const SizedBox(height: 70,),
            FilledButton(onPressed: (){
              _onConfrim();
            }, child: Text("Confirm")),
            Spacer(),
          ],
        ),
      )),
    );
  }
  
  Future<void> _onConfrim()async{
    showLoading(context);
    Map<String,String> requestBody = {
      'email':widget.email,
      'code':_otpController.text,
    };
    NetworkResponse response = await NetworkCaller.jsonPostRequest(Urls.activateUser,requestBody);
    if(response.isSuccess){
      Navigator.pushNamedAndRemoveUntil(context, WidgetTree.name, (predicate)=>false);
    }else{
      showSnackBarMessage(context, response.errorMessage??"Failed");
    }
  }
}
