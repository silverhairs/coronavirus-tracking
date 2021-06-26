/// Thrown if an exception occurs while making an `http` request.
class HttpException implements Exception {
  const HttpException([this.message]);

  /// Message to display in the log when [HttpException] is thrown.
  final String? message;

  @override
  String toString() {
    return 'HttpException($message)';
  }
}

/// Thrown if an `http` request returns a non-200 status code.
class HttpRequestFailure implements Exception {
  const HttpRequestFailure(this.statusCode, [this.message]);

  /// Message to display in the log when [HttpRequestFailure] is thrown.
  final String? message;

  /// Status code of the http response.
  final int statusCode;

  @override
  String toString() {
    return 'HttpRequestFailure($message)';
  }
}

/// Thrown when an error occurs while decoding the response body
class JsonDecodeException implements Exception {
  const JsonDecodeException([this.message]);

  /// Message to display in the log when [JsonDecodeException] is thrown.
  final String? message;

  @override
  String toString() {
    return 'JsonDecodeException($message)';
  }
}

/// Thrown when an error occurs while deserializing the response body
class JsonDeserializeException implements Exception {
  const JsonDeserializeException([this.message]);

  /// Message to display in the log when [JsonDeserializeException] is thrown.
  final String? message;

  @override
  String toString() {
    return 'JsonDeserializeException($message)';
  }
}
