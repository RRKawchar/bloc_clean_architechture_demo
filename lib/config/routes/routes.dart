import 'package:bloc_clean_architecture/config/routes/routes_name.dart';
import 'package:bloc_clean_architecture/view/view.dart';
import 'package:flutter/material.dart';

class Routes{

  static Route<dynamic> generatedRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (_)=>const HomeScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_)=>const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No route generated"),
            ),
          );
        });
    }
  }


}