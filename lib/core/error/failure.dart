import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
}

class ServerFailure implements Failure {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => null;
}

class CacheFailure implements Failure {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => null;
}

class NetworkFailure implements Failure {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => null;
}
