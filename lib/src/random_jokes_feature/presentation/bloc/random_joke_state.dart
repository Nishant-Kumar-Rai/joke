part of 'random_joke_bloc.dart';

abstract class RandomJokeState extends Equatable {
  const RandomJokeState();

  @override
  List<Object> get props => [];
}

class RandomJokeInitial extends RandomJokeState {
  const RandomJokeInitial();
}

class RandomJokeLoading extends RandomJokeState {
  const RandomJokeLoading();
}

class RandomJokeLoaded extends RandomJokeState {
  const RandomJokeLoaded(this.randomJoke);

  final RandomJoke randomJoke;

  @override
  List<Object> get props => [randomJoke.id];
}

class RandomJokeError extends RandomJokeState {
  const RandomJokeError(this.errMessage);

  final String errMessage;

  @override
  List<Object> get props => [errMessage];
}
