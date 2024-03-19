

import 'package:flutter/material.dart';

import 'package:task_manager_project_in_flutter/data/base_url.dart';
import 'package:task_manager_project_in_flutter/data/network_caller.dart';
import 'package:task_manager_project_in_flutter/presentation/screens/add_newtask_created_screens.dart';
import 'package:task_manager_project_in_flutter/presentation/screens/statuscount_headerscreen.dart';
import 'package:task_manager_project_in_flutter/presentation/utilitites/Colors_App.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/backGroundWidget.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/profileLogoAppBarWidget.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/show_snackbar.dart';


import '../widgets/taskCardCounter.dart';
import '../widgets/taskCardDetails.dart';
import 'listdataNew.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  statusCountDataHeader countDataHeader = statusCountDataHeader();
  liststatutusNew liststautusnew=liststatutusNew();
   bool isStatusCountInProgress=false;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskCountDataLoading();
   _listTaskByStatusNew();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:profileAppBar,
      body:backGroundWidget(
        child:Column(
          children: [
            Visibility(visible:isStatusCountInProgress==false,
                replacement:Center(child: LinearProgressIndicator()) ,
                child: TaskCounterWidget),
            Expanded(child:RefreshIndicator(
              onRefresh: ()async{_taskCountDataLoading();
                           _listTaskByStatusNew();
              },
              child: ListView.builder(itemCount:liststautusnew.dataNewStatus?.length?? 0,itemBuilder: (context,index){
                return TaskCardDetails(taskitem:liststautusnew.dataNewStatus![index],ondelete:
                (){_delete(liststautusnew.dataNewStatus![index].sId!);
                },ondedit:(){
                  _updateDataState(liststautusnew.dataNewStatus![index].sId!);
                } );
              }),
            ))
          ],
        ) ,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewTaskCreated()));
      },
        backgroundColor: AppColor.ThemeColor,
      child: Icon(Icons.add,color: Colors.pink,),),
    );
  }
  Widget get TaskCounterWidget{
    return SizedBox(height: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(itemCount: countDataHeader.dataTaskCounter?.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context,index){
              return CardTask(
                 title: countDataHeader.dataTaskCounter![index].sum ?? 0,
                  amount:countDataHeader.dataTaskCounter![index].sId ?? '');
            }, separatorBuilder: (_,__){
              return SizedBox(width:12,);
            }),
      ),
    );

  }
  Future<void> _taskCountDataLoading()async{
  isStatusCountInProgress=true;
  setState((){
  });

  final response=await NetworkCaller.GetRequest(Url.taskStatusCount);
  if(response.Issuccess){
    countDataHeader=statusCountDataHeader.fromJson(response.responsebody);
    isStatusCountInProgress =false;
    setState(() {

    });
  }else{
   if (mounted){
     isStatusCountInProgress=false;
     setState(() {

     });
     ShowSnackBarMessage(context, response.errormessage ?? 'failed status');
    }
  }

  }
  Future<void> _listTaskByStatusNew()async{

     final response=await NetworkCaller.GetRequest(Url.listTaskByStatusNew);
     if(response.Issuccess){
       liststautusnew=liststatutusNew.fromJson(response.responsebody) ;


     }else{
       if (mounted){

         ShowSnackBarMessage(context, response.errormessage ?? 'failed in new task status');
       }
     }

  }
  Future<void>_delete(String id)async{

   final response= await NetworkCaller.GetRequest(Url.deleteTask(id));


   if(response.Issuccess){
     _listTaskByStatusNew();
     _taskCountDataLoading();
   }

   else{

            if(mounted){ ShowSnackBarMessage(context, response.errormessage ?? 'failed in new task status');
            }
   }
  }
  Future<void> _updateTaskStatus(String id,String status)async{
     final response=await NetworkCaller.GetRequest(Url.updateTaskStatus(id, status));
     if(response.Issuccess){
       _taskCountDataLoading();
       _listTaskByStatusNew();
     }
     else{
     if(mounted){
       ShowSnackBarMessage(context, 'not updated status');
     }
     }
  }
  void _updateDataState(String id){
   showDialog(context: context, builder:(context){
     return AlertDialog(
       title: Text('select status'),
       content: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           ListTile(title: Text('new'),trailing:Icon(Icons.check),),
           ListTile(title: Text('completed'),onTap: (){
             _updateTaskStatus(id,'completed');
             Navigator.pop(context);
           },),
           ListTile(title: Text('progress'),onTap: (){
             _updateTaskStatus(id, 'progress');
             Navigator.pop(context);
           },),
           ListTile(title: Text('cancel'),onTap: (){
             _updateTaskStatus(id,'cancel');
             Navigator.pop(context);
           },),

         ],
       ),
     );
   }
   );
  }
}




