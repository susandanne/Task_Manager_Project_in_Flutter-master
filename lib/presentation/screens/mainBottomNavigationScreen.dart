import 'package:flutter/material.dart';
import 'package:task_manager_project_in_flutter/presentation/screens/newTask_screens.dart';

import '../utilitites/Colors_App.dart';
import 'Progress_Task_screens.dart';
import 'cancelled_Task_screens.dart';
import 'complete_Task_screens.dart';

class BottomNaviagtion extends StatefulWidget {
  const BottomNaviagtion({super.key});

  @override
  State<BottomNaviagtion> createState() => _BottomNaviagtionState();
}

class _BottomNaviagtionState extends State<BottomNaviagtion> {
 int _currentIndex=0;
 List<Widget>_TaskScreens=[ NewTask(),Complete(),Progress(),Cancelled(),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: _TaskScreens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(items:
      [
        BottomNavigationBarItem(icon: Icon(Icons.task_alt_sharp),label: "task"),
        BottomNavigationBarItem(icon: Icon(Icons.incomplete_circle_sharp),label: "complete"),
        BottomNavigationBarItem(icon: Icon(Icons.three_k_plus_sharp),label: "progress"),
        BottomNavigationBarItem(icon: Icon(Icons.delete_outline_sharp),label: "cancelled"),
      ],
      selectedItemColor:AppColor.ThemeColor,
      unselectedItemColor: Colors.grey,

       showUnselectedLabels: true,
       currentIndex:_currentIndex,
        onTap:(index){
          _currentIndex=index;
        if(mounted){

          setState(() {

          });
        }
        }

      ),
    );
  }
}
