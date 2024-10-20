import 'package:freezed_annotation/freezed_annotation.dart';

import '../joke/joke.dart';

part 'search_joke_result.freezed.dart';
part 'search_joke_result.g.dart';

@freezed
class SearchJokeResult with _$SearchJokeResult {
  const factory SearchJokeResult({
    required int current_page,
    required int limit,
    required int next_page,
    required int previous_page,
    @JsonKey(name: 'results') required List<Joke> jokes,
    required String search_term,
    required int status,
    required int total_jokes,
    required int total_pages,
  }) = _SearchJokeResult;

  factory SearchJokeResult.fromJson(Map<String, dynamic> json) =>
      _$SearchJokeResultFromJson(json);
}

// List<Joke> _resultFromJson(Object? json) {
//   if (json is List) {
//     return json.map((e) => Joke.fromJson(e as Map<String, dynamic>)).toList();
//   }
//   return []; // Return an empty list if json is null or not a list
// }
