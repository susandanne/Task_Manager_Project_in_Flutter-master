
import 'package:flutter/material.dart';

import '../../data/task_item.dart';

class TaskCardDetails extends StatelessWidget {
  const TaskCardDetails({
    super.key,required this.taskitem, required this.ondelete,required this.ondedit
  });

  final taskData taskitem;
  final VoidCallback ondelete;
  final VoidCallback ondedit;

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
            Text(taskitem.title ?? '',style: TextStyle(fontWeight: FontWeight.bold)),
            Text(taskitem.description ?? ''),
            Text('${taskitem.createdDate}'),
            Row(children: [
              Chip(label: Text(taskitem.status ?? '')),
              Spacer(),
              IconButton(onPressed: (){
                ondedit();
              }, icon: Icon(Icons.edit)),
              IconButton(onPressed: (){
                ondelete();print(ondelete);
              }, icon: Icon(Icons.delete_forever_sharp)),
            ],)
          ],
        ),
      ) ,
    );
  }
}