import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jokes/core/error/exceptions.dart';
import 'package:jokes/core/error/failure.dart';
import 'package:jokes/src/random_jokes_feature/data/datasource/joke_remote_data_source.dart';
import 'package:jokes/src/random_jokes_feature/data/model/RandomJokesModel.dart';
import 'package:jokes/src/random_jokes_feature/data/repository/random_jokes_repo_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockJokeRemoteDataSource extends Mock implements JokeRemoteDataSource {}

void main() {
  late JokeRemoteDataSource remoteDataSource;
  late RandomJokesRepoImpl repoImpl;

  const tModel = RandomJokeModel(
      id: "R7UfaahVfFd",
      joke:
          "My dog used to chase people on a bike a lot. It got so bad I had to take his bike away.",
      status: 200);

  setUp(() {
    remoteDataSource = MockJokeRemoteDataSource();
    repoImpl = RandomJokesRepoImpl(remoteDataSource);
  });

  const tServerException =
      ServerExceptions(message: "Unknown error occurred.", statusCode: 500);

  test("should return a [Server Failure] when the call to the server fails]",
      () async {
    when(() => remoteDataSource.getRandomJokes()).thenThrow(tServerException);
    final result = await repoImpl.getRandomJoke();
    expect(
        result,
        equals(Left<APIFailure, dynamic>(APIFailure(
            message: tServerException.message,
            statusCode: tServerException.statusCode))));
    verify(() => remoteDataSource.getRandomJokes()).called(1);
    verifyNoMoreInteractions(remoteDataSource);
  });

  test("should return a[RandomJokeModel] when the call to server is successful",
      () async {
    when(() => remoteDataSource.getRandomJokes())
        .thenAnswer((_) async => const Right(tModel));
    final result = await repoImpl.getRandomJoke();
    expect(result, equals(const Right(tModel)));
    verify(() => remoteDataSource.getRandomJokes()).called(1);
    verifyNoMoreInteractions(remoteDataSource);
  });
}
