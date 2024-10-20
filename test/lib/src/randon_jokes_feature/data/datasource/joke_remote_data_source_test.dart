import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:jokes/core/error/exceptions.dart';
import 'package:jokes/core/utils/constants.dart';
import 'package:jokes/src/random_jokes_feature/data/datasource/joke_remote_data_source.dart';
import 'package:jokes/src/random_jokes_feature/data/model/RandomJokesModel.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late http.Client client;
  late JokeRemoteDataSource jokeRemoteDataSource;

  setUp(() {
    client = MockClient();
    jokeRemoteDataSource = JokeRemoteDataSrcImpl(client);
    registerFallbackValue(Uri());
  });

  group("getRandomJoke", () {
    const mockResponse = '''
{
  "id": "some_id",
  "joke": "This is a funny joke.", 
  "status": 200
}
''';
    test("getRandomJokes returns  [RandomJokesModel] on success", () async {
      //Arrange
      when(() => client.get(any()))
          .thenAnswer((_) async => http.Response(mockResponse, 200));
      //Act
      final result = await jokeRemoteDataSource.getRandomJokes();

      //Assert
      expect(result, isA<Right<dynamic, RandomJokeModel>>());
      expect(result, equals(Right(RandomJokeModel.fromJson(mockResponse))));
      verify(() => client.get(Uri.parse("$baseUrl$randomDadJokes")))
          .called(1);
    });

    test(
        "getRandomJokes throws APIException when the status code is not 200 or 201",
        () async {
      when(() => client.get(any()))
          .thenAnswer((_) async => http.Response('Unauthorized access', 401));
      final result = jokeRemoteDataSource.getRandomJokes;

      expect(
          (() async => await result()),
          throwsA(const ServerExceptions(
              message: 'Unauthorized access', statusCode: 401)));

      verify(() => client.get(Uri.parse("$baseUrl$randomDadJokes")))
          .called(1);
    });
  });
}
