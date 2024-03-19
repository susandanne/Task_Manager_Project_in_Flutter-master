import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:task_manager_project_in_flutter/app.dart';
import 'package:task_manager_project_in_flutter/data/auth_controller.dart';
import 'package:task_manager_project_in_flutter/data/network_caller.dart';
import 'package:task_manager_project_in_flutter/presentation/screens/sign_in_screen.dart';
import 'package:task_manager_project_in_flutter/presentation/screens/update_data_screens.dart';
import 'package:task_manager_project_in_flutter/presentation/utilitites/Colors_App.dart';

PreferredSizeWidget get profileAppBar {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: AppColor.ThemeColor,
    title: GestureDetector(
      onTap: () {
        Navigator.push(TaskManager.globalKeyContext.currentState!.context,
            MaterialPageRoute(builder: (context) => UpdataDtata()));
      },
      child: Row(
        children: [
          CircleAvatar(),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'calllname',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'email',
                style: TextStyle(fontSize: 12),
              )
            ],
          )),
          IconButton(
            onPressed: () async {
              await AuthController.userDataClear();
              Navigator.pushAndRemoveUntil(
                  TaskManager.globalKeyContext.currentContext!,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                  (route) => false);
            },
            icon: Icon(Icons.logout_outlined),
          )
        ],
      ),
    ),
  );
}
