abstract class ApiException implements Exception {
  final String? message;
  final String? prefix;

  ApiException([this.message, this.prefix]);
}

class BadRequestException extends ApiException {
  BadRequestException(String? message) : super(message, "Bad Request");
}

class FetchDataException extends ApiException {
  FetchDataException(String? message) : super(message, "Unable to process");
}

class UnAuthorizedException extends ApiException {
  UnAuthorizedException(String? message)
      : super(message, "UnAuthorized request");
}
