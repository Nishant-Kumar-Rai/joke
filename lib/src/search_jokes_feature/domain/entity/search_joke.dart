import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../core/utils/typeDef.dart';

class SearchJoke extends Equatable {
  const SearchJoke({required this.id, required this.joke});

  final String id;
  final String joke;

  @override
  List<Object?> get props => [id];

  factory SearchJoke.fromJson(String json) =>
      SearchJoke.fromMap(jsonDecode(json) as DataMap);

  SearchJoke.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          joke: map['Joke'] as String,
        );

  DataMap toMap() => {
        'id': id,
        'joke': joke,
      };

  String toJson() => jsonEncode(toMap());
}
