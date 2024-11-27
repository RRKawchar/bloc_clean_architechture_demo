import 'package:bloc_clean_architecture/config/app_url.dart';
import 'package:bloc_clean_architecture/data/network/network_api_services.dart';
import 'package:bloc_clean_architecture/models/user/user_model.dart';

class LoginRepository{
  final _api=NetworkApiServices();

  Future<UserModel> login(dynamic body)async{
    final response = await _api.postRequest(AppUrl.loginApi, body);
    return UserModel.fromJson(response);
  }


}