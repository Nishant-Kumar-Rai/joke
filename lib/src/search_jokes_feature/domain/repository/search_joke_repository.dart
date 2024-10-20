import 'package:jokes/core/utils/typeDef.dart';

import '../../data/models/SearchJokeResult/search_joke_result.dart';
import '../usecase/search_joke_usecase.dart';

abstract class SearchJokeRepository {
  const SearchJokeRepository();

  ResultFuture<SearchJokeResult> searchJoke(Args args);
}
