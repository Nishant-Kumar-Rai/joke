import 'package:equatable/equatable.dart';
import 'package:jokes/src/search_jokes_feature/domain/entity/search_joke.dart';

class SearchJokeResultEntity extends Equatable {
  const SearchJokeResultEntity({
    required this.current_page,
    required this.previous_page,
    required this.next_page,
    required this.result,
    required this.search_term,
    required this.status,
    required this.total_jokes,
    required this.total_pages,
  });

  final int current_page;
  final int previous_page;
  final int next_page;
  final List<SearchJoke> result;
  final String search_term;
  final int status;
  final int total_jokes;
  final int total_pages;

  @override
  List<Object?> get props => [search_term];
}
