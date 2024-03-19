import 'package:flutter/material.dart';
import 'package:task_manager_project_in_flutter/presentation/screens/pin_verification_screen.dart';
import 'package:task_manager_project_in_flutter/presentation/screens/signup_screen.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/backGroundWidget.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
 final TextEditingController _emailController =TextEditingController();

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
                    'Your Email Address ',
                    style:Theme.of(context).textTheme.titleLarge
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      'A 6 digit code sent to your email for verification ',
                        style: TextStyle(color: Colors.grey,fontSize:16 ),
                  ),   SizedBox(
                    height:8,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'email address'),
                  ),

                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(width:double.infinity,
                      child:ElevatedButton(onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>pinVerificationScreen()));
                      }, child: Icon(Icons.icecream_outlined))),

                  Row(mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                    Text('have an Account !!!',style: TextStyle(color: Colors.red),),
                    TextButton(onPressed:(){
                      Navigator.pop(context);
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
    _emailController.dispose();
    super.dispose();
  }
}
