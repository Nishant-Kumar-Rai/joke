part of 'random_joke_bloc.dart';

abstract class RandomJokeEvent extends Equatable {
  const RandomJokeEvent();
}

class GetRandomJokeEvent extends RandomJokeEvent {
  const GetRandomJokeEvent();

  @override
  List<Object?> get props => [];
}
