import 'package:flutter/material.dart';

import 'package:task_manager_project_in_flutter/presentation/widgets/backGroundWidget.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/profileLogoAppBarWidget.dart';


import '../widgets/taskCardDetails.dart';

class Cancelled extends StatefulWidget {
  const Cancelled({super.key});

  @override
  State<Cancelled> createState() => _NewTaskState();
}

class _NewTaskState extends State<Cancelled> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:profileAppBar,
      body:backGroundWidget(
        child:ListView.builder(itemCount: 6,itemBuilder: (context,index){
          // return TaskCardDetails();
        }) ,
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {},
      //   backgroundColor: AppColor.ThemeColor,
      // child: Icon(Icons.add,color: Colors.pink,),),
    );
  }

}




