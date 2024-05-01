/// Base class for custom application exceptions.
class AppException implements Exception {
  final _message; // Message associated with the exception
  final _prefix; // Prefix for the exception

  /// Constructor for creating an [AppException] instance.
  ///
  /// The [message] parameter represents the message associated with the exception,
  /// and the [prefix] parameter represents the prefix for the exception.
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix'; // Returns the formatted error message
  }
}

/// Exception class representing a fetch data error during communication.
class FetchDataException extends AppException {
  /// Constructor for creating a [FetchDataException] instance.
  ///
  /// The [message] parameter represents the error message.
  FetchDataException([String? message]) : super(message, 'Error During Communication');
}

/// Exception class representing a bad request error.
class BadRequestException extends AppException {
  /// Constructor for creating a [BadRequestException] instance.
  ///
  /// The [message] parameter represents the error message.
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

/// Exception class representing an unauthorized request error.
class UnauthorisedException extends AppException {
  /// Constructor for creating an [UnauthorisedException] instance.
  ///
  /// The [message] parameter represents the error message.
  UnauthorisedException([String? message]) : super(message, 'Unauthorised request');
}

/// Exception class representing an invalid input error.
class InvalidInputException extends AppException {
  /// Constructor for creating an [InvalidInputException] instance.
  ///
  /// The [message] parameter represents the error message.
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

/// Exception class representing a no internet connection error.
class NoInternetException extends AppException {
  /// Constructor for creating a [NoInternetException] instance.
  ///
  /// The [message] parameter represents the error message.
  NoInternetException([String? message]) : super(message, 'No Internet Connection');
}
