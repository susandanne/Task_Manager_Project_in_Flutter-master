
import 'package:flutter/material.dart';
import 'package:task_manager_project_in_flutter/data/network_caller.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/backGroundWidget.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/profileLogoAppBarWidget.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/show_snackbar.dart';

import '../../data/base_url.dart';

class AddNewTaskCreated extends StatefulWidget {
  const AddNewTaskCreated({super.key});

  @override
  State<AddNewTaskCreated> createState() => _AddNewTaskCreatedState();
}

class _AddNewTaskCreatedState extends State<AddNewTaskCreated> {
  final TextEditingController _textEditingControllertitle =
      TextEditingController();
  final TextEditingController _textEditingControllerdescription =
      TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool addnewTaskInProgress=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar,
      body: backGroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Text('Add  new task please'),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _textEditingControllertitle,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'enter title plz';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'title'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _textEditingControllerdescription,
                    maxLines: 3,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'enter description  plz';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: 'description'),
                  ),
                  Visibility(visible:addnewTaskInProgress==false,
                    replacement:Center(child:CircularProgressIndicator()),
                    child: ElevatedButton(
                        onPressed: () {
                          if(_key.currentState!.validate()){
                            addNewTaskCreated();
                            Navigator.pop(context);
                          }
              
                        },
                        child: Text('add new task',style: TextStyle(color: Colors.black),)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addNewTaskCreated() async {
    addnewTaskInProgress=true;
    setState(() {
    });
    Map<String,dynamic>createParams={
      "title":_textEditingControllertitle.text.trim(),
      "description":_textEditingControllerdescription.text.trim(),
      "status":"New"
    };
    final response = await NetworkCaller.GetPost(Url.createTask, createParams);

    print(response.responsebody);
    if(response.Issuccess){
      _textEditingControllertitle.clear();
      _textEditingControllerdescription.clear();
     if(mounted){
       ShowSnackBarMessage(context, 'created successfully');
     }
      addnewTaskInProgress=false;
      setState(() {
      });
    }
    else{
      if(mounted){
        ShowSnackBarMessage(context,response.errormessage ?? 'failed dear!!!!!!!',true);
      }
      addnewTaskInProgress=false;
      setState(() {
      });
    }

  }

  @override
  void dispose() {
    _textEditingControllertitle.dispose();
    _textEditingControllerdescription.dispose();
    super.dispose();
  }
}
