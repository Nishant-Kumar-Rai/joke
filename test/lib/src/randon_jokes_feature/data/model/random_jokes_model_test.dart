import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jokes/core/utils/typeDef.dart';
import 'package:jokes/src/random_jokes_feature/data/model/RandomJokesModel.dart';

import '../../../../../fixtures/fixtures_reader.dart';

void main() {
  const tModel = RandomJokeModel(
      id: "R7UfaahVfFd",
      joke:
          "My dog used to chase people on a bike a lot. It got so bad I had to take his bike away.",
      status: 200);
  final tJson = fixture('random_joke.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group("Random joke model test", () {
    test(" is a subclass of [RandomJokes] entity", () {
      expect(tModel, isA<RandomJokeModel>());
    });

    test("should return a [RandomJokeModel] from a map", () {
      final result = RandomJokeModel.fromMap(tMap);
      expect(result, equals(tModel));
    });

    test("should return a [RandomJokeModel] from a json", () {
      final result = RandomJokeModel.fromJson(tJson);
      expect(result, tModel);
    });

    test("should return a map from RandomJokeModel", () {
      final result = tModel.toMap();
      expect(result, equals(tMap));
    });

    test("should return a jsonString", () {
      final result = tModel.toJson();
      final tJson = jsonEncode({
        "id": "R7UfaahVfFd",
        "joke": "My dog used to chase people on a bike a lot. It got so bad I had to take his bike away.",
        "status": 200
      });
      expect(result, equals(tJson));
    });
  });
}
