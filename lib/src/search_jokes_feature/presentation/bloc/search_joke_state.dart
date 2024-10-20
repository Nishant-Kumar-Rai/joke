part of 'search_joke_bloc.dart';

abstract class SearchJokeState extends Equatable {
  const SearchJokeState();

  @override
  List<Object> get props => [];
}

class SearchJokeInitial extends SearchJokeState {
  const SearchJokeInitial();
}

class SearchJokeLoading extends SearchJokeState {
  const SearchJokeLoading();
}

class SearchJokeLoaded extends SearchJokeState {
  const SearchJokeLoaded({
    required this.resultModel,
    required this.jokeList,
  });

  final List<Joke> jokeList;

  final SearchJokeResult resultModel;

  @override
  List<Object> get props => [
        resultModel,
      ];
}

class SearchJokeError extends SearchJokeState {
  const SearchJokeError({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
