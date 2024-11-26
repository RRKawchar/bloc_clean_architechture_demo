import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_clean_architecture/data/exceptions/app_exception.dart';
import 'package:bloc_clean_architecture/data/network/base_api_services.dart';
import 'package:http/http.dart' as http ;

class NetworkApiServices extends BaseApiServices{



  @override
  Future<dynamic> getRequest(String url) async{
    dynamic jsonResponse;
    try{
   var response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));
    jsonResponse = returnResponse(response);
   if(response.statusCode==200){

   }
    }on SocketException{
      throw NoInternetException('');
    }on TimeoutException{
      throw TimeoutException('Time out try again');
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> postRequest(String url,var body) async{
    dynamic jsonResponse;
    try{
      var response=await http.post(Uri.parse(url),body: body).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
      if(response.statusCode==200){

      }
    }on SocketException{
      throw NoInternetException('');
    }on TimeoutException{
      throw TimeoutException('Time out try again');
    }
    return jsonResponse;
  }


  @override
  Future<dynamic> deleteRequest(String url) async{
    dynamic jsonResponse;
    try{
      var response=await http.delete(Uri.parse(url)).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);
      if(response.statusCode==200){

      }
    }on SocketException{
      throw NoInternetException('');
    }on TimeoutException{
      throw TimeoutException('Time out try again');
    }
    return jsonResponse;
  }



  dynamic returnResponse(http.Response response){
    switch(response){
      case 200:
        dynamic jsonResponse=jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse=jsonDecode(response.body);
        return jsonResponse;
      case 401:
       throw UnauthorizedException();
      case 500:
        throw FetchDataException('Error Communicating with server ${response.statusCode}');
      default:
        throw UnauthorizedException();

    }
  }

}