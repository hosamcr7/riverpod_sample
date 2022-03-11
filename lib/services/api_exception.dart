class AppException implements Exception {
  final String _message;
  final String _prefix;

  AppException(this._message,  this._prefix);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([ message])
      : super(message.toString(), "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([ message]) : super(message.toString(), "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([ message]) : super(message.toString(), "Unauthorised: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([ message]) : super(message.toString(), "Invalid: ");
}