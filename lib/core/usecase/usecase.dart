// Abstraction to make sure all our use cases in the project adhere to this contract

import 'package:jokes/core/utils/typeDef.dart';

abstract class UsecaseWithParams<Type, Param> {
  const UsecaseWithParams();

  ResultFuture<Type> call(Param param);
}

abstract class UsecaseWithoutParam<Type> {
  const UsecaseWithoutParam();

  ResultFuture<Type> call();
}
