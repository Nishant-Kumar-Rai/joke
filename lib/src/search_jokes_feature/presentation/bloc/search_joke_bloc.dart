import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes/src/search_jokes_feature/data/models/joke/joke.dart';
import 'package:jokes/src/search_jokes_feature/domain/usecase/search_joke_usecase.dart';

import '../../data/models/SearchJokeResult/search_joke_result.dart';

part 'search_joke_event.dart';
part 'search_joke_state.dart';

class SearchJokeBloc extends Bloc<SearchJokeEvent, SearchJokeState> {
  final SearchJokeUseCase _searchJokeUseCase;
  String _searchTerm = "";
  int _currentPage = 1;

  SearchJokeBloc({required SearchJokeUseCase searchJokeUseCase})
      : _searchJokeUseCase = searchJokeUseCase,
        super(const SearchJokeInitial()) {
    on<OnStartSearch>(_onStartSearchEventHandler);
    on<OnLoadMore>(_onLoadMoreEventHandler);
  }

  Future<void> _onStartSearchEventHandler(
      OnStartSearch event, Emitter<SearchJokeState> emit) async {
    emit(const SearchJokeLoading());
    _searchTerm = event.searchTerm;
    _currentPage = 1;
    final arg = Args(searchTerm: _searchTerm, pageToFetch: _currentPage);
    final searchJokeResult = await _searchJokeUseCase(arg);

    searchJokeResult.fold(
      (failure) => emit(SearchJokeError(
          errorMessage: '${failure.statusCode}: ${failure.message}')),
      (result) => emit(
        SearchJokeLoaded(
            resultModel: result, jokeList: result.jokes),
      ),
    );
  }

  Future<void> _onLoadMoreEventHandler(
      OnLoadMore event, Emitter<SearchJokeState> emit) async {
    _currentPage++;
    final arg = Args(searchTerm: _searchTerm, pageToFetch: _currentPage);
    final result = await _searchJokeUseCase.call(arg);
    result.fold(
      (failure) => emit(SearchJokeError(
          errorMessage: '${failure.statusCode}: ${failure.message}')),
      (newJokes) {
        final updatedJokes = [
          ...(state as SearchJokeLoaded).jokeList,
          ...newJokes.jokes
        ];
        emit(SearchJokeLoaded(
          resultModel: newJokes,
          jokeList: updatedJokes,
        ));
      },
    );
  }
}
