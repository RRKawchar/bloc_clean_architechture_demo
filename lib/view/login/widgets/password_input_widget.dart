import 'package:bloc_clean_architecture/bloc/login/login_bloc.dart';
import 'package:bloc_clean_architecture/bloc/login/login_event.dart';
import 'package:bloc_clean_architecture/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordInputWidget({
    super.key,
    required this.passwordFocusNode,
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LoginBloc,LoginStates>(
        buildWhen: (current,previous)=>current.password !=previous.password,
        builder: (context,state){
          return TextFormField(
            keyboardType: TextInputType.text,
            focusNode: passwordFocusNode,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: 'Password', border: OutlineInputBorder()),
            onChanged: (val) {
              context.read<LoginBloc>().add(PasswordChanged(password: val));
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter Password";
              }

              if(value.length<6){
                return "Please enter password greater then 6 char";
              }
              return null;
            },
            onFieldSubmitted: (val) {},
          );
        });
  }
}
