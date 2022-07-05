import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class NoNetworkError extends Failure {
  NoNetworkError() : super("Not connect internet");
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}
