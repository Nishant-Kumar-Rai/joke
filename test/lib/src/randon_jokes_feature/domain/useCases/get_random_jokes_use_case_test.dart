/// What does the class depends on
/// Answer-> RandomJokesRepo
///How can we create that dependency
/// Answer-> Use Mocktail
/// How do we control what our dependency does
///Answer-> Using the Mock tail api

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokes/src/random_jokes_feature/domain/entities/random_jokes.dart';
import 'package:jokes/src/random_jokes_feature/domain/repositories/random_jokes_repo.dart';
import 'package:jokes/src/random_jokes_feature/domain/useCases/get_random_jokes_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockRandomJokesRepo extends Mock implements RandomJokesRepo {}

void main() {
  late GetRandomJokesUseCase useCase;
  late RandomJokesRepo repo;
  setUp(() {
    repo = MockRandomJokesRepo();
    useCase = GetRandomJokesUseCase(repo);
  });
  test('should call the [RandomJokesRepo.getRandomJokes()]', () async {
    /** Arrange **/
    const RandomJoke joke = RandomJoke(id: '', joke: '', status: 1);
    when(() => repo.getRandomJoke()).thenAnswer((_) async => const Right(joke));
    /** Act **/
    final result = await useCase();
    /** Assert **/
    expect(result, equals(const Right<dynamic, RandomJoke>(joke)));
    verify(() => repo.getRandomJoke()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
