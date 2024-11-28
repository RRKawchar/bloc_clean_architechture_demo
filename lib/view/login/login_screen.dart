import 'package:bloc_clean_architecture/bloc/login/login_bloc.dart';
import 'package:bloc_clean_architecture/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final emailFocusNode=FocusNode();
  final passwordFocusNode=FocusNode();
  final _formKey=GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    _loginBloc=LoginBloc(loginRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text("Login"),
     ),

      body: BlocProvider(
          create: (_)=>_loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EmailInputWidget(emailFocusNode: emailFocusNode),
                const SizedBox(height: 20),

                PasswordInputWidget(passwordFocusNode: passwordFocusNode),

                const SizedBox(height: 20),
                LoginButton(
                  formKey: _formKey,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
