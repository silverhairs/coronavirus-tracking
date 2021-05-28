class FetchIngException implements Exception {
  const FetchIngException([this.message]);
  final String? message;

  // ignore: annotate_overrides
  String toString() {
    Object? message = this.message;
    if (message == null) return 'FetchIngException';
    return 'FetchIngException: $message';
  }
}
