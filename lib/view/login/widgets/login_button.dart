import 'package:bloc_clean_architecture/bloc/login/login_bloc.dart';
import 'package:bloc_clean_architecture/bloc/login/login_event.dart';
import 'package:bloc_clean_architecture/bloc/login/login_state.dart';
import 'package:bloc_clean_architecture/utils/enums.dart';
import 'package:bloc_clean_architecture/utils/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButton({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {

    return BlocListener<LoginBloc,LoginStates>(
      listenWhen: (current,previous)=>current.postApiStatus !=previous.postApiStatus,
        listener: (context,states){
          if(states.postApiStatus==PostApiStatus.error){
            FlushBarHelper.flushBarErrorMessage(states.message.toString(), context);
          }
          if(states.postApiStatus==PostApiStatus.success){
            FlushBarHelper.flushBarSuccessMessage("Login Successfully!", context);
          }

        },
      child: BlocBuilder<LoginBloc,LoginStates>(
          buildWhen: (current,previous)=>current.postApiStatus !=previous.postApiStatus,
          builder: (context,state){
            return state.postApiStatus==PostApiStatus.loading?const CircularProgressIndicator():ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginSubmit());


                  }
                },
                child: const Text("Login"));
          }),
    );
  }
}
