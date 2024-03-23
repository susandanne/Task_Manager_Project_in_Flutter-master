import 'dart:convert';
import 'dart:io';



import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:task_manager_project_in_flutter/data/auth_controller.dart';
import 'package:task_manager_project_in_flutter/data/base_url.dart';
import 'package:task_manager_project_in_flutter/data/network_caller.dart';
import 'package:task_manager_project_in_flutter/data/user_data_login_part.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/backGroundWidget.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/profileLogoAppBarWidget.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/show_snackbar.dart';

class UpdataDtata extends StatefulWidget {
  const UpdataDtata({super.key});

  @override
  State<UpdataDtata> createState() => _UpdataDtataState();
}

class _UpdataDtataState extends State<UpdataDtata> {
  // final TextEditingController _title = TextEditingController();
  // final TextEditingController _description = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _fastName = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  XFile? pickedImage;
  bool updateProfileInprogress=false;
  @override
  void initState() {
    super.initState();
    _email.text=AuthController.userdata?.email ?? '';
    _lastname.text=AuthController.userdata?.lastName ?? '';
    _fastName.text=AuthController.userdata?.firstName ?? '';
    _phone.text=AuthController.userdata?.mobile ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:profileAppBar,
      body: backGroundWidget(
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _key,
              child: Column(
                children: [Text('update your data'),
                  SizedBox(height: 8,),
                  Imagecontainer(),
                  SizedBox(height: 8,),
              TextFormField(controller: _email,
                enabled: false,
                keyboardType:TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'email'
                ),),
                  SizedBox(height: 8,),
                  TextFormField(controller: _fastName,
                    decoration: InputDecoration(
                      hintText: 'first name'
                    ),

                  ),
                  SizedBox(height: 8,),
                  TextFormField(controller: _lastname,
                    decoration: InputDecoration(
                      hintText: 'last name'
                    ),
                  ),
                  SizedBox(height: 8,),

                  TextFormField(
                    controller: _phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: 'phone'
                    ),

                  ),
                  SizedBox(height: 8,),
                  TextFormField(controller:_password,
                    decoration: InputDecoration(
                        hintText: 'password'
                    ),

                  ),
                  SizedBox(height: 8,),

                  Visibility(
                    visible:updateProfileInprogress==false,
                    replacement:Center(child: CircularProgressIndicator()),
                    child: ElevatedButton(onPressed: (){
                      updateProfileData();
                    }, child:Text('update your data') ),
                  )


                ],
              ),
            ),
          ),
        ) ,
      ),
    );
  }

  Widget Imagecontainer() {
    return GestureDetector(
      onTap: (){
        imagePicker();
      },
      child: Container(
                    // color: Colors.pink,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:Row(
                      children: [
                        Container(
                          color: Colors.amber,
                          padding: EdgeInsets.all(10),
                          child: Text('Image'),
                        ),
                        SizedBox(width: 16,),
                        Expanded(child: Text(pickedImage?.name ?? '',maxLines:1,
                          style: TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis),)),
                      ],
                    ) ,
                  ),
    );
  }
  @override
  void dispose() {
    _fastName.dispose();
    _lastname.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }
 Future <void> imagePicker()async{
    ImagePicker imagePicker =ImagePicker();
    // pickedImage= await imagePicker.pickImage(source: ImageSource.gallery);
    pickedImage= await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {

    });
  }
  Future <void> updateProfileData()async {
    String? photo;
    updateProfileInprogress = true;
    setState(() {

    });
    Map<String, dynamic> inputUpdateParams = {
      "email": _email.text,
      "firstName": _fastName.text.trim(),
      "lastName": _lastname.text.trim(),
      "mobile": _phone.text.trim()
      // "password": "1234",
      // "photo": ""
    };
    if (_password.text.isNotEmpty) {
      inputUpdateParams['password'] = _password.text;
    }
    if (pickedImage != null) {
      List<int>bytes = File(pickedImage!.path).readAsBytesSync();
      photo = base64Encode(bytes);
      inputUpdateParams['photo'] = photo;
    }
    final response = await NetworkCaller.GetPost(
        Url.profileUpdate, inputUpdateParams);
    updateProfileInprogress = false;
    if (response.Issuccess) {
      if (response.responsebody['success'] == true) {
        UserData userData = UserData(
            email: _email.text,
            firstName: _fastName.text.trim(),
            lastName: _lastname.text.trim(),
            mobile: _phone.text.trim(),
            photo: photo
        );
        AuthController.saveUserData(userData);
        setState(() {

        });

        if (!mounted) {
          return;
        }
        setState(() {

        });
        ShowSnackBarMessage(context, 'update data failed ');
      }
    }
  }
}
