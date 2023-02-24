/// Exceptions caused when calling  API
class RestApiException implements Exception {
  /// Constructor
  const RestApiException({this.errorCode, this.errorMessage});

  /// Error Status Code
  final int? errorCode;

  /// Error message
  final String? errorMessage;
}

/// Exception when there is not internet connection
class NoInternetConnectionException implements Exception {
  /// Constructor
  const NoInternetConnectionException(this.message);

  /// Error message
  final String message;
}