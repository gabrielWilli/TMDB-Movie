import 'package:filmeira/core/error/failure.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return "Error ServerFailure";
    case NetworkFailure:
      return "Error NetworkFailure";
    default:
      return 'Unexpected error';
  }
}