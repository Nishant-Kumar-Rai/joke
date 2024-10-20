import 'package:equatable/equatable.dart';

class ServerExceptions extends Equatable implements Exception {
  const ServerExceptions({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}
