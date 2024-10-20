import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:jokes/core/error/exceptions.dart';
import 'package:jokes/core/utils/constants.dart';
import 'package:jokes/src/search_jokes_feature/data/models/SearchJokeResult/search_joke_result.dart';

import '../../../../core/utils/typeDef.dart';
import '../../domain/usecase/search_joke_usecase.dart';

abstract class SearchJokeDataSource {
  ResultFuture<SearchJokeResult> getSearchJokeResult(Args args);
}

class SearchJokeDataSourceImpl extends SearchJokeDataSource {
  SearchJokeDataSourceImpl(this._client);

  final http.Client _client;

  @override
  ResultFuture<SearchJokeResult> getSearchJokeResult(Args args) async {
    final page = args.pageToFetch ?? 1;
    try {
      final response = await _client.get(
          Uri.parse('$baseUrl$searchRandomJokeEndPoint'
              '?term=${args.searchTerm}'
              '&page=$page'),
          headers: {'Accept': 'application/json'});

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerExceptions(
            message: response.body, statusCode: response.statusCode);
      }

      // Parse the JSON string here
      final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      final result = SearchJokeResult.fromJson(jsonMap);
      return Right(SearchJokeResult.fromJson(jsonMap));
    } catch (e) {
      throw ServerExceptions(message: e.toString(), statusCode: 505);
    }
  }
}
