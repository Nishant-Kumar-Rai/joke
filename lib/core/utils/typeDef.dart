// Simplify the names that are comonly used but long

import 'package:dartz/dartz.dart';
import 'package:jokes/core/error/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;
