import 'package:flutter/material.dart';
import 'package:task_manager_project_in_flutter/presentation/utilitites/Colors_App.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/backGroundWidget.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/profileLogoAppBarWidget.dart';

import '../widgets/taskCardCounter.dart';
import '../widgets/taskCardDetails.dart';

class Complete extends StatefulWidget {
  const Complete({super.key});

  @override
  State<Complete> createState() => _NewTaskState();
}

class _NewTaskState extends State<Complete> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:profileAppBar,
      body:backGroundWidget(
        child:ListView.builder(itemCount: 3,itemBuilder: (context,index){
           // return TaskCardDetails();
        }) ,
      ),

    );
  }

}




