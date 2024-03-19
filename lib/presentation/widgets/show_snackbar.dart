
import 'package:flutter/material.dart';

void ShowSnackBarMessage(BuildContext Context,String message,[bool Iserrormessage=false]){
  ScaffoldMessenger.of(Context).showSnackBar(SnackBar(content: Text(message),
  backgroundColor:Iserrormessage?Colors.red :null ,));

}