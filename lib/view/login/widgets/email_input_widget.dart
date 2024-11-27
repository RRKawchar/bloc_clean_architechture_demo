import 'package:bloc_clean_architecture/bloc/login/login_bloc.dart';
import 'package:bloc_clean_architecture/bloc/login/login_event.dart';
import 'package:bloc_clean_architecture/bloc/login/login_state.dart';
import 'package:bloc_clean_architecture/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;
  const EmailInputWidget({super.key, required this.emailFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginStates>(
        buildWhen: (current,previous)=>current.email !=previous.email,
        builder: (context,state){
       return TextFormField(
        keyboardType: TextInputType.emailAddress,
        focusNode: emailFocusNode,
        decoration: const InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder()
        ),
        onChanged: (val){
          context.read<LoginBloc>().add(EmailChanged(email: val));
        },
        validator: (value) {
          if(value!.isEmpty){
            return "Enter Email";
          }
          if(!Validations.emailValidator(value)){
            return "Email is not correct";
          }
          return null;
        },
        onFieldSubmitted: (val){},
      );
    });
  }
}
