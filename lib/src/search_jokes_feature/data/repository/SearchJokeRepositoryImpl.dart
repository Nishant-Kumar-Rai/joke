import 'package:dartz/dartz.dart';
import 'package:jokes/core/error/exceptions.dart';
import 'package:jokes/core/utils/typeDef.dart';
import 'package:jokes/src/search_jokes_feature/data/datasource/search_joke_data_source.dart';
import 'package:jokes/src/search_jokes_feature/data/models/SearchJokeResult/search_joke_result.dart';
import 'package:jokes/src/search_jokes_feature/domain/repository/search_joke_repository.dart';

import '../../../../core/error/failure.dart';
import '../../domain/usecase/search_joke_usecase.dart';

class SearchJokeRepositoryImpl extends SearchJokeRepository {
  SearchJokeRepositoryImpl(this._searchJokeDataSource);

  final SearchJokeDataSource _searchJokeDataSource;

  @override
  ResultFuture<SearchJokeResult> searchJoke(
      Args args) async {
    try {
      return await _searchJokeDataSource.getSearchJokeResult(
         args);
    } on ServerExceptions catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
