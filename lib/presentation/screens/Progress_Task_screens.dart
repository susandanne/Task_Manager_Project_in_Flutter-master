import 'package:flutter/material.dart';
import 'package:task_manager_project_in_flutter/presentation/utilitites/Colors_App.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/backGroundWidget.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/profileLogoAppBarWidget.dart';

import '../widgets/taskCardCounter.dart';
import '../widgets/taskCardDetails.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _NewTaskState();
}

class _NewTaskState extends State<Progress> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:profileAppBar,
      body:backGroundWidget(
        child:ListView.builder(itemCount: 2,itemBuilder: (context,index){
          // return TaskCardDetails();
        }) ,
      ),

    );
  }

}




