import 'dart:async';

import 'package:bloc_clean_architecture/config/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';

class SplashService{

  static void onCheckSplash(BuildContext context){
    Timer(const Duration(seconds: 3),()=>
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route)=>false)
    );
  }

}