import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:jokes/src/random_jokes_feature/data/datasource/joke_remote_data_source.dart';
import 'package:jokes/src/random_jokes_feature/data/repository/random_jokes_repo_impl.dart';
import 'package:jokes/src/random_jokes_feature/domain/repositories/random_jokes_repo.dart';
import 'package:jokes/src/random_jokes_feature/domain/useCases/get_random_jokes_use_case.dart';
import 'package:jokes/src/random_jokes_feature/presentation/bloc/random_joke_bloc.dart';
import 'package:jokes/src/search_jokes_feature/data/datasource/search_joke_data_source.dart';
import 'package:jokes/src/search_jokes_feature/data/repository/SearchJokeRepositoryImpl.dart';
import 'package:jokes/src/search_jokes_feature/domain/repository/search_joke_repository.dart';
import 'package:jokes/src/search_jokes_feature/domain/usecase/search_joke_usecase.dart';
import 'package:jokes/src/search_jokes_feature/presentation/bloc/search_joke_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///AppLogic
  sl.registerFactory(() => RandomJokeBloc(getRandomJokesUseCase: sl()));
  sl.registerFactory(() => SearchJokeBloc(searchJokeUseCase: sl()));

  ///Use case
  sl.registerLazySingleton(() => GetRandomJokesUseCase(sl()));
  sl.registerLazySingleton(() => SearchJokeUseCase(sl()));

  ///Repository
  sl.registerLazySingleton<RandomJokesRepo>(() => RandomJokesRepoImpl(sl()));
  sl.registerLazySingleton<SearchJokeRepository>(
      () => SearchJokeRepositoryImpl(sl()));

  ///Data source
  sl.registerLazySingleton<JokeRemoteDataSource>(
      () => JokeRemoteDataSrcImpl(sl()));
  sl.registerLazySingleton<SearchJokeDataSource>(
      () => SearchJokeDataSourceImpl(sl()));

  ///External Dependency
  sl.registerLazySingleton(http.Client.new);
}
