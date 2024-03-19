import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_project_in_flutter/data/user_data_login_part.dart';

class AuthController {
   static String? accessToken;
   static Future<void> saveUserData(UserData userdata) async {
      SharedPreferences sharedPreferences = await SharedPreferences
          .getInstance();
      await sharedPreferences.setString(
          'userdata', jsonEncode(userdata.toJson()));

   }

   static Future<UserData?> getUserData() async {
      SharedPreferences sharedPreferences = await SharedPreferences
          .getInstance();
      String? resultAuth = sharedPreferences.getString('userdata');
      if (resultAuth == null) {
         return null;
      }
      return UserData.fromJson(jsonDecode(resultAuth));
   }

   static Future<void> saveUserToken(String token) async {
      SharedPreferences sharedPreferences = await SharedPreferences
          .getInstance();
      await sharedPreferences.setString('token', token);
      accessToken=token;
   }

   static Future<String?> getUserToken() async {
      SharedPreferences sharedPreferences = await SharedPreferences
          .getInstance();
      return sharedPreferences.getString('token');
   }

   static Future <bool> isUserLoggedIn() async {
      final resultAuth = await getUserToken();
      accessToken=resultAuth;
      return resultAuth != null;
   }

   static Future<void> userDataClear() async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     await sharedPreferences.clear();

   }
}