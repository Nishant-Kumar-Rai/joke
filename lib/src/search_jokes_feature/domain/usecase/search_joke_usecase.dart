import 'package:jokes/core/usecase/usecase.dart';
import 'package:jokes/core/utils/typeDef.dart';
import 'package:jokes/src/search_jokes_feature/domain/repository/search_joke_repository.dart';

import '../../data/models/SearchJokeResult/search_joke_result.dart';

class SearchJokeUseCase extends UsecaseWithParams<SearchJokeResult, Args> {
  const SearchJokeUseCase(this._searchJokeRepository);

  final SearchJokeRepository _searchJokeRepository;

  @override
  ResultFuture<SearchJokeResult> call(param) {
    return _searchJokeRepository.searchJoke(param);
  }
}

class Args {
  const Args({required this.searchTerm, this.pageToFetch});

  final String searchTerm;
  final int? pageToFetch;
}
