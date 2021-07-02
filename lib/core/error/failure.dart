import 'package:equatable/equatable.dart';
import 'package:filmeira/core/error/exception.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
}

class ServerException implements Exception {}

class CacheException implements Exception {}
