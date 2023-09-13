import 'package:fpdart/fpdart.dart';
import 'package:pofy/core/types/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
