import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokes/src/random_jokes_feature/domain/entities/random_jokes.dart';
import 'package:jokes/src/random_jokes_feature/domain/useCases/get_random_jokes_use_case.dart';
import 'package:jokes/src/random_jokes_feature/presentation/bloc/random_joke_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockGetRandomJokeUseCase extends Mock implements GetRandomJokesUseCase {}

void main() {
  late GetRandomJokesUseCase getRandomJokesUseCase;
  late RandomJokeBloc randomJokeBloc;

  const tRandomJoke = RandomJoke(id: "id", joke: "joke", status: 200);

  setUp(() {
    getRandomJokesUseCase = MockGetRandomJokeUseCase();
    randomJokeBloc =
        RandomJokeBloc(getRandomJokesUseCase: getRandomJokesUseCase);
  });

  test("initial state should be [RandomJokeInitial]", () {
    expect(randomJokeBloc.state, const RandomJokeInitial());
  });

  blocTest<RandomJokeBloc, RandomJokeState>(
    "should emit [RandomJokeLoading, RandomJokeLoaded] when successful",
    build: () {
      when(() => getRandomJokesUseCase())
          .thenAnswer((_) async => const Right(tRandomJoke));
      return randomJokeBloc;
    },
    act: (randomJokeBloc) => randomJokeBloc.add(const GetRandomJokeEvent()),
    expect: () =>
        [const RandomJokeLoading(), const RandomJokeLoaded(tRandomJoke)],
    verify: (_) => {
      verify(() => getRandomJokesUseCase()).called(1),
      verifyNoMoreInteractions(getRandomJokesUseCase)
    },
  );

  tearDown(() {
    randomJokeBloc.close();
  });
}
