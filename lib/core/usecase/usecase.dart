// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmeira/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, List<Type>>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
