

import 'package:flutter/material.dart';

import 'package:task_manager_project_in_flutter/data/base_url.dart';
import 'package:task_manager_project_in_flutter/presentation/widgets/show_snackbar.dart';

import '../../data/network_caller.dart';
import '../../data/task_item.dart';

class TaskCardDetails extends StatefulWidget {
  const TaskCardDetails({
    super.key,required this.taskitem,required this.refreshItem
  });

  final taskData taskitem;
  final VoidCallback refreshItem;

  @override
  State<TaskCardDetails> createState() => _TaskCardDetailsState();
}

class _TaskCardDetailsState extends State<TaskCardDetails> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink,
      margin:EdgeInsets.symmetric(horizontal: 8,vertical: 5),
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.taskitem.title ?? '',style: TextStyle(fontWeight: FontWeight.bold)),
            Text(widget.taskitem.description ?? ''),
            Text('${widget.taskitem.createdDate}'),
            Row(children: [
              Chip(label: Text(widget.taskitem.status ?? '')),
              Spacer(),
              IconButton(onPressed: (){
                _updateDataState(widget.taskitem.sId!);
              }, icon: Icon(Icons.edit)),
              IconButton(onPressed: (){
                _delete(widget.taskitem.sId!);
              }, icon: Icon(Icons.delete_forever_sharp)),
            ],)
          ],
        ),
      ) ,
    );
  }

  void _updateDataState(String id){
    showDialog(context:context, builder:(context){
      return AlertDialog(
        title: Text('select status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(title: Text('new'),trailing:Icon(Icons.check),),
            ListTile(title: Text('completed'),onTap: (){
              _updateTaskStatus(id,'Completed');
              Navigator.pop(context);
            },),
            ListTile(title: Text('progress'),onTap: (){
              _updateTaskStatus(id, 'Progress');
              Navigator.pop(context);
            },),
            ListTile(title: Text('cancel'),onTap: (){
              _updateTaskStatus(id,'Cancel');
              Navigator.pop(context);
            },),

          ],
        ),
      );
    }
    );
  }

  Future<void> _updateTaskStatus(String id,String status)async{
    final response=await NetworkCaller.GetRequest(Url.updateTaskStatus(id, status));
    if(response.Issuccess){
    widget.refreshItem();
    }
    else{
      if(mounted) {
        ShowSnackBarMessage(context, 'not updated status');
      }

    }
  }

  Future<void>_delete(String id)async{

    final response= await NetworkCaller.GetRequest(Url.deleteTask(id));


    if(response.Issuccess){
     widget.refreshItem();
    }

    else if (mounted){

      ShowSnackBarMessage(context, response.errormessage ?? 'failed in new task status');

    }
  }
}