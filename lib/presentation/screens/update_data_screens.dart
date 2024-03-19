import 'package:flutter/material.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/backGroundWidget.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/profileLogoAppBarWidget.dart';

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
                  Container(
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
                        Text('Photo.png',style: TextStyle(color: Colors.white),),
                      ],
                    ) ,
                  ),
                  SizedBox(height: 8,),
              TextFormField(controller: _email,
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

                  ElevatedButton(onPressed: (){}, child:Text('update your data') )


                ],
              ),
            ),
          ),
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
}
