import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager_project_in_flutter/app.dart';
import 'package:task_manager_project_in_flutter/data/auth_controller.dart';
import 'package:task_manager_project_in_flutter/presentation/screens/sign_in_screen.dart';
import 'package:task_manager_project_in_flutter/response_object.dart';

class NetworkCaller {
  static Future<ResponseObject> GetRequest(String url) async {
    try {
      final Response response = await get(Uri.parse(url),headers:{'token':AuthController.accessToken ?? ''});
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        final decodeDta = jsonDecode(response.body);
        return ResponseObject(
            Issuccess: true, statuscode: 200, responsebody: decodeDta);
      }
     else if (response.statusCode == 401) {
        _moveToSignIn();
        return ResponseObject(
            Issuccess: true, statuscode:response.statusCode, responsebody: '');
      }
      else {
        return ResponseObject(
            Issuccess: false,
            statuscode: response.statusCode,
            responsebody: '');
      }
    } catch (e) {
      return ResponseObject(
          Issuccess: false,
          statuscode: -1,
          responsebody: '',
          errormessage: e.toString());
    }
  }

  static Future<ResponseObject> GetPost(
      String url, Map<String, dynamic> body ,{bool fromSignInState=false }) async {
    try {
      final Response response = await post(Uri.parse(url),
          body: jsonEncode(body),
          headers: {'Content-type': 'application/json',
          'token':AuthController.accessToken ?? ''});
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        final decodeDta = jsonDecode(response.body);
        return ResponseObject(
            Issuccess: true, statuscode: 200, responsebody: decodeDta);
      } else if (response.statusCode == 401) {
        if(fromSignInState){
          // return ResponseObject(Issuccess: true, statuscode:response.statusCode, responsebody: '');
        }else{
          _moveToSignIn();
        }

        return ResponseObject(
            Issuccess: true, statuscode:response.statusCode, responsebody: '',errormessage: 'wrong credentials');
      }

      else {
        return ResponseObject(
            Issuccess: false,
            statuscode: response.statusCode,
            responsebody: '');
      }
    } catch (e) {
      return ResponseObject(
          Issuccess: false,
          statuscode: -1,
          responsebody: '',
          errormessage: e.toString());
    }
  }
  static Future<void>_moveToSignIn()async{
    await AuthController.userDataClear();

    Navigator.pushAndRemoveUntil(TaskManager.globalKeyContext.currentState!.context, MaterialPageRoute(builder: (context)=>SignInScreen()), (route) => false);
  }
}
