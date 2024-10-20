import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes/src/random_jokes_feature/domain/entities/random_jokes.dart';
import 'package:jokes/src/random_jokes_feature/domain/useCases/get_random_jokes_use_case.dart';

part 'random_joke_event.dart';
part 'random_joke_state.dart';

class RandomJokeBloc extends Bloc<RandomJokeEvent, RandomJokeState> {
  RandomJokeBloc({required GetRandomJokesUseCase getRandomJokesUseCase})
      : _getRandomJokesUseCase = getRandomJokesUseCase,
        super(const RandomJokeInitial()) {
    on<GetRandomJokeEvent>(_getRandomJokeHandler);
  }

  final GetRandomJokesUseCase _getRandomJokesUseCase;

  Future<void> _getRandomJokeHandler(
      GetRandomJokeEvent event, Emitter<RandomJokeState> emit) async {
    // emit(const RandomJokeLoading());

    final randomJokeResult = await _getRandomJokesUseCase();
    randomJokeResult.fold(
        (failure) =>
            emit(RandomJokeError('${failure.statusCode} : ${failure.message}')),
        (joke) => emit(RandomJokeLoaded(joke)));
  }
}
