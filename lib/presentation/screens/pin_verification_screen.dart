import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:task_manager_project_in_flutter/presentation/screens/setpassword_screen.dart';

import 'package:task_manager_project_in_flutter/presentation/screens/sign_in_screen.dart';
import 'package:task_manager_project_in_flutter/presentation/utilitites/Colors_App.dart';

import 'package:task_manager_project_in_flutter/presentation/widgets/backGroundWidget.dart';

class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({super.key});

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {
 final TextEditingController _pinController =TextEditingController();

 final GlobalKey<FormState>formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: backGroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    'Pin Verification please ',
                    style:Theme.of(context).textTheme.titleLarge
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      'A 6 digit code sent to your email for verification ',
                        style: TextStyle(color: Colors.grey,fontSize:16 ),
                  ),   SizedBox(
                    height: 8,
                  ),
                  PinCodeTextField(
                   controller: _pinController,
                    length: 6,
                    obscureText: false,
                    keyboardType:TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      inactiveColor: AppColor.ThemeColor,
                      selectedFillColor: Colors.white


                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onCompleted: (v) {
                    },
                    onChanged: (value) {
                    },
                    appContext:context,
                  ),

                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(width:double.infinity,
                      child:ElevatedButton(onPressed:(){

                         Navigator.push(context,MaterialPageRoute(builder:(context)=>setPasswordScreen()));


                      }, child:Text('verify please'))),

                  Row(mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                    Text('have an Account !!!',style: TextStyle(color: Colors.red),),
                      TextButton(onPressed: (){
                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:(context)=>SignInScreen()), (route) => false);
                      }, child: Text('Sign Please',style: TextStyle(color: Colors.amber,fontSize: 25),))
                    ],
                    )],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }
}
// TextButton(onPressed:(){
// Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>SignInScreen()), (route) => false);
// }, child:Text('Sign In Please',style: TextStyle(color:Colors.amber,fontSize:20 ),
// )],)