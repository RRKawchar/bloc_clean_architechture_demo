class AppException implements Exception{
  final _message;
  final _prefix;
  AppException([this._message,this._prefix]);

  @override
  String toString(){
    return '$_message$_prefix';
  }
}

class NoInternetException extends AppException{
  NoInternetException([String?message]):super(message,'No Internet Exception');
}

class UnauthorizedException extends AppException{
  UnauthorizedException([String?message]):super(message,'You don\'t have access to this');
}

class RequestTimeException extends AppException{
  RequestTimeException([String?message]):super(message,'Request time out');
}

class FetchDataException extends AppException{
  FetchDataException([String?message]):super(message,'');
}