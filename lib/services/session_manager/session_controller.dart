import 'dart:convert';

import 'package:bloc_clean_architecture/models/user/user_model.dart';
import 'package:bloc_clean_architecture/services/storage/local_storage.dart';
import 'package:flutter/cupertino.dart';

class SessionController{

  static final SessionController _session=SessionController._internal();
  final LocalStorage storage=LocalStorage();
  UserModel user =UserModel();
  bool? isLogin;

  SessionController._internal(){
    isLogin=false;
  }

  factory SessionController(){
   return _session;
  }



  Future<void> saveUserInPreference(dynamic user)async{

    storage.setValue('token', jsonEncode(user));
    storage.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPreference()async{
    try{
  var userData=await storage.readValue('token');
  var isLogin=await storage.readValue('isLogin');

  if(userData.isNotEmpty){
    SessionController().user=UserModel.fromJson(jsonDecode(userData));
  }
  SessionController().isLogin = isLogin =='true' ? true:false;
    }catch(e){
      debugPrint(e.toString());
    }
  }
}