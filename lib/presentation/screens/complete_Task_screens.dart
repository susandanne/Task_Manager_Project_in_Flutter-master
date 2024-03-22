

import 'package:flutter/material.dart';
import 'package:task_manager_project_in_flutter/data/base_url.dart';


import 'package:task_manager_project_in_flutter/presentation/widgets/backGroundWidget.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/profileLogoAppBarWidget.dart';

import '../../data/network_caller.dart';
import '../widgets/show_snackbar.dart';
import '../widgets/taskCardDetails.dart';
import 'listdataNew.dart';


class Complete extends StatefulWidget {
  const Complete({super.key});

  @override
  State<Complete> createState() => _NewTaskState();
}

class _NewTaskState extends State<Complete> {

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listTaskByStatusCompleted();
  }

 liststatutusNew liststautusCompleted=liststatutusNew();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:profileAppBar,
      body:backGroundWidget(
        child:ListView.builder(itemCount:liststautusCompleted.dataNewStatus?.length ?? 0
            ,itemBuilder: (context,index){
            return TaskCardDetails(
              taskitem:liststautusCompleted.dataNewStatus![index],
              refreshItem: (){
                _listTaskByStatusCompleted();
              }

            );
        }) ,
      ),

    );
  }
  Future<void> _listTaskByStatusCompleted()async{

    final response=await NetworkCaller.GetRequest(Url.listTaskByStatusCompleted);
    if(response.Issuccess){
      liststautusCompleted=liststatutusNew.fromJson(response.responsebody) ;


    }else{
      if (mounted){

        ShowSnackBarMessage(context, response.errormessage ?? 'failed in new task status');
      }
    }

  }


}




