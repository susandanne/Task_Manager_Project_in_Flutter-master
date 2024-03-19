import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_project_in_flutter/presentation/screens/sign_in_screen.dart';
import 'package:task_manager_project_in_flutter/presentation/utilitites/Colors_App.dart';

import 'package:task_manager_project_in_flutter/presentation/widgets/backGroundWidget.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({super.key});

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
 final TextEditingController _PasswordController =TextEditingController();
 final TextEditingController _confirmPasswordController =TextEditingController();

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
                    'Set Password  ',
                    style:Theme.of(context).textTheme.titleLarge
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      'Use A 8 digit letters with numbers  ',
                        style: TextStyle(color: Colors.grey,fontSize:16 ),
                  ),   SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                     controller: _PasswordController,

                    decoration: InputDecoration(hintText: 'Password'),
                  ),  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                     controller: _confirmPasswordController,

                    decoration: InputDecoration(hintText: 'Cpnfirm Password'),
                  ),
              SizedBox(
                height: 18,),
                  SizedBox(width:double.infinity,
                      child:ElevatedButton(onPressed:(){
                        Navigator.pop(context);
                      }, child:Text('set Password'))),

                  Row(mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                    Text('have an Account !!!',style: TextStyle(color: Colors.red,),),
                    TextButton(onPressed:(){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>SignInScreen()), (route) => false);
                    }, child:Text('Sign In Please',style: TextStyle(color:Colors.amber,fontSize:20 ),)),
                  ],)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _PasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
