import 'package:dartz/dartz.dart';
import 'package:jokes/core/utils/typeDef.dart';
import 'package:jokes/src/random_jokes_feature/data/datasource/joke_remote_data_source.dart';
import 'package:jokes/src/random_jokes_feature/domain/entities/random_jokes.dart';
import 'package:jokes/src/random_jokes_feature/domain/repositories/random_jokes_repo.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';

class RandomJokesRepoImpl extends RandomJokesRepo {
  const RandomJokesRepoImpl(this._remoteDataSource);

  final JokeRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<RandomJoke> getRandomJoke() async {
    try {
      return await _remoteDataSource.getRandomJokes();
    } on ServerExceptions catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
