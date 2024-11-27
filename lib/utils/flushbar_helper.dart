import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class FlushBarHelper{

  static void flushBarErrorMessage(String message,BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          borderRadius: BorderRadius.circular(20),
          positionOffset: 20,
          icon: const Icon(Icons.error,color: Colors.white38,),
        )
          ..show(context)
    );
  }


  static void flushBarSuccessMessage(String message,BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.green,
          reverseAnimationCurve: Curves.easeInOut,
          borderRadius: BorderRadius.circular(20),
          positionOffset: 20,
          icon: const Icon(Icons.done,color: Colors.white38,),
        )
          ..show(context)
    );
  }

}