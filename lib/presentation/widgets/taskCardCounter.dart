
import 'package:flutter/material.dart';

class CardTask extends StatelessWidget {
  const CardTask({
    super.key, required this.amount, required this.title,
  });
  final String amount;
  final int title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [Text('$title',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),Text(amount,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.w300),)],
        ),
      ),
    );
  }
}