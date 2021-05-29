import 'package:equatable/equatable.dart';

class FetchIngException extends Equatable implements Exception {
  const FetchIngException([this.message]);
  final String? message;

  @override
  String toString() {
    if (message == null) return 'FetchIngException';
    return 'FetchIngException: $message';
  }

  @override
  List<Object?> get props => [message];
}

class TrackingException extends Equatable implements Exception {
  const TrackingException([this.message]);
  final String? message;

  @override
  String toString() {
    if (message == null) return 'TrackingException';
    return 'TrackingException: $message';
  }

  @override
  List<Object?> get props => [message];
}
