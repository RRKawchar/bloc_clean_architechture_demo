import 'package:bloc_clean_architecture/bloc/login/login_event.dart';
import 'package:bloc_clean_architecture/bloc/login/login_state.dart';
import 'package:bloc_clean_architecture/repository/auth/login_repository.dart';
import 'package:bloc_clean_architecture/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {

  LoginRepository loginRepository=LoginRepository();

  LoginBloc() : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmit>(_loginSubmit);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password)); // Correctly updating the password
  }

  void _loginSubmit(LoginSubmit event, Emitter<LoginStates> emit) async {
    if (state.email.isEmpty || state.password.isEmpty) {
      emit(state.copyWith(
        message: "Email and password cannot be empty",
        postApiStatus: PostApiStatus.error,
      ));
    }

    Map body = {
      "email": state.email,
      "password": state.password,
    };

  //   {
  //     "email": "eve.holt@reqres.in",
  //   "password": "cityslicka"
  // }

    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    await loginRepository.login(body).then((value) {
      if (value.error.isNotEmpty) {
        emit(state.copyWith(
          message: value.error.toString(),
          postApiStatus: PostApiStatus.error,
        ));
      } else {
        emit(state.copyWith(
          message: "Login successfully!",
          postApiStatus: PostApiStatus.success,
        ));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        message: error.toString(),
        postApiStatus: PostApiStatus.error,
      ));
    });
  }
}
