import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:jokes/core/utils/typeDef.dart';
import 'package:jokes/src/random_jokes_feature/data/model/RandomJokesModel.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class JokeRemoteDataSource {
  ResultFuture<RandomJokeModel> getRandomJokes();
}

class JokeRemoteDataSrcImpl extends JokeRemoteDataSource {
  JokeRemoteDataSrcImpl(this._client);

  final http.Client _client;

  @override
  ResultFuture<RandomJokeModel> getRandomJokes() async {
    try {
      final response = await _client.get(Uri.parse("$baseUrl$randomDadJokes"),
          headers: {'Accept': "application/json"});
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerExceptions(
            message: response.body, statusCode: response.statusCode);
      }
      return Right(RandomJokeModel.fromJson(response.body));
    } on ServerExceptions {
      rethrow;
    } catch (e) {
      throw ServerExceptions(message: e.toString(), statusCode: 505);
    }
  }
}
