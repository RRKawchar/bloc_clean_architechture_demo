import 'package:bloc_clean_architecture/bloc/login/login_bloc.dart';
import 'package:bloc_clean_architecture/bloc/login/login_event.dart';
import 'package:bloc_clean_architecture/bloc/login/login_state.dart';
import 'package:bloc_clean_architecture/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButton({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {

    return BlocListener<LoginBloc,LoginStates>(
        listener: (context,states){
          if(states.postApiStatus==PostApiStatus.error){
            ScaffoldMessenger.of(context)..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(states.message.toString()))
                );
          }
          if(states.postApiStatus==PostApiStatus.success){
            ScaffoldMessenger.of(context)..hideCurrentSnackBar()
              ..showSnackBar(
                  SnackBar(content: Text(states.message.toString()))
              );
          }

          if(states.postApiStatus==PostApiStatus.loading){
            ScaffoldMessenger.of(context)..hideCurrentSnackBar()
              ..showSnackBar(
                  const SnackBar(content: Text("Submitting...."))
              );
          }
        },
      child: BlocBuilder<LoginBloc,LoginStates>(
          buildWhen: (current,previous)=>false,
          builder: (context,state){
            return ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginSubmit());


                  }
                },
                child: Text("Login"));
          }),
    );
  }
}
