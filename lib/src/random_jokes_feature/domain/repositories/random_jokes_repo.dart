import 'package:jokes/core/utils/typeDef.dart';
import 'package:jokes/src/random_jokes_feature/domain/entities/random_jokes.dart';

abstract class RandomJokesRepo {
  const RandomJokesRepo();

  ResultFuture<RandomJoke> getRandomJoke();
}
