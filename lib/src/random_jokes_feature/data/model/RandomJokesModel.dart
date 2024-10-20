import 'dart:convert';

import 'package:jokes/core/utils/typeDef.dart';
import 'package:jokes/src/random_jokes_feature/domain/entities/random_jokes.dart';

class RandomJokeModel extends RandomJoke {
  const RandomJokeModel(
      {required super.id, required super.joke, required super.status});

  factory RandomJokeModel.fromJson(String json) =>
      RandomJokeModel.fromMap(jsonDecode(json) as DataMap);

  RandomJokeModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          joke: map['joke'] as String,
          status: map['status'] as int,
        );

  DataMap toMap() => {'id': id, 'joke': joke, 'status': status};

  String toJson() => jsonEncode(toMap());
}
