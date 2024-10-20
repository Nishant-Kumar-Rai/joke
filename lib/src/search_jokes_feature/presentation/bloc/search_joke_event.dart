part of 'search_joke_bloc.dart';

abstract class SearchJokeEvent extends Equatable {
  const SearchJokeEvent();

  @override
  List<Object?> get props => [];
}

class OnStartSearch extends SearchJokeEvent {
  const OnStartSearch({required this.searchTerm});

  final String searchTerm;

  @override
  List<Object?> get props => [searchTerm];
}

class OnLoadMore extends SearchJokeEvent {
  const OnLoadMore();
}
