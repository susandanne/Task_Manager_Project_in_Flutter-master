import 'package:flutter/material.dart';
import 'package:task_manager_project_in_flutter/data/base_url.dart';
import 'package:task_manager_project_in_flutter/data/network_caller.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/backGroundWidget.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/show_snackbar.dart';
import 'package:task_manager_project_in_flutter/response_object.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordlController = TextEditingController();
  final TextEditingController _nameFirstlController = TextEditingController();
  final TextEditingController _nameLastlController = TextEditingController();
  final TextEditingController _phonelController = TextEditingController();
  final GlobalKey<FormState> _keySignUp=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: backGroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _keySignUp,
              child: Column(
                children: [
                  Text('sign up here',
                      style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator:(String?value){

                      if(value?.trim().isEmpty ?? true){
                        return 'enter your email';
                      }
                      return null;} ,
                    decoration: InputDecoration(hintText: 'Your email address'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _nameFirstlController,
                    keyboardType: TextInputType.text,
                    validator:(String?value){

                      if(value?.trim().isEmpty ?? true){
                        return 'enter your first name';
                      }
                      return null;} ,
                    decoration: InputDecoration(hintText: 'Your first name'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _nameLastlController,
                    keyboardType: TextInputType.text,
                    validator:(String?value){

                      if(value?.trim().isEmpty ?? true){
                        return 'enter your last name';
                      }
                      return null;} ,
                    decoration: InputDecoration(hintText: 'Your last name'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _phonelController,
                    keyboardType: TextInputType.phone,
                    validator:(String?value){

                      if(value?.trim().isEmpty ?? true){
                        return 'enter your phone';
                      }
                      return null;} ,
                    decoration: InputDecoration(hintText: 'Your phone '),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _passwordlController,
                    obscureText: true,
                    validator:(String?value){

                      if(value?.trim().isEmpty ?? true){
                        return 'enter your password';
                      }
                      if(value!.length < 6){
                        return 'more than 6 letter';
                      }
                      return null;} ,
                    decoration: InputDecoration(hintText: 'Your Password '),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async{
                            if(_keySignUp.currentState!.validate()){
                              Map<String,dynamic> Params={
                                "email": _emailController.text.trim(),
                                "firstName":_nameFirstlController.text.trim(),
                                "lastName": _nameLastlController.text.trim(),
                                "mobile": _phonelController.text.trim(),
                                "password":_passwordlController.text,

                              };
                            ResponseObject response =await NetworkCaller.GetPost(Url.registrationUrl,Params);
                              print(response.statuscode);
                              print(response);
                            if(response.Issuccess){
                                  if(mounted){
                                    ShowSnackBarMessage(context, 'done reg plz login now');

                             Navigator.pop(context);
                            }


                            }
                            else{
                              if(mounted){
                                ShowSnackBarMessage(context,'failed reg!!!!!!!!!!',true);
                              }
                            }
                              // Navigator.pop(context);
                            }
                          }, child: Icon(Icons.icecream))),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' have an Account !!!',
                        style: TextStyle(
                            color: Colors.red,),
                      ),
                      TextButton(
                          onPressed: () {
                             Navigator.pop(context);
                          },
                          child: Text(
                            'Sign In Please',
                            style: TextStyle(
                                color: Colors.amber,

                                fontSize: 20),
                          )),
                    ],
                  )
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
    _nameFirstlController.dispose();
    _nameLastlController.dispose();
    _phonelController.dispose();
    _passwordlController.dispose();
    super.dispose();
  }
}
