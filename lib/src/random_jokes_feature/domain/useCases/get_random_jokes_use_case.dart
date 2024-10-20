import 'package:jokes/core/usecase/usecase.dart';
import 'package:jokes/core/utils/typeDef.dart';
import 'package:jokes/src/random_jokes_feature/domain/entities/random_jokes.dart';
import 'package:jokes/src/random_jokes_feature/domain/repositories/random_jokes_repo.dart';

class GetRandomJokesUseCase extends UsecaseWithoutParam<RandomJoke> {
  const GetRandomJokesUseCase(this._repository);

  final RandomJokesRepo _repository;

  @override
  ResultFuture<RandomJoke> call() {
    return _repository.getRandomJoke();
  }
}
