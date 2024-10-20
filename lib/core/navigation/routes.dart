import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/src/random_jokes_feature/presentation/bloc/random_joke_bloc.dart';
import 'package:jokes/src/search_jokes_feature/presentation/bloc/search_joke_bloc.dart';
import 'package:jokes/src/search_jokes_feature/presentation/view/search_joke_screen.dart';

import '../../src/random_jokes_feature/presentation/view/random_joke_screen.dart';
import '../services/injection_container.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RandomJokeHome.routeName:
      return _pageBuilder(
          (_) => BlocProvider(
              create: (_) => sl<RandomJokeBloc>(),
              child: const RandomJokeHome()),
          settings: settings);

    case SearchJokeScreen.routeName:
      return _pageBuilder((_) => BlocProvider(
          create: (_) => sl<SearchJokeBloc>(),
          child: const SearchJokeScreen()), settings: settings);

    default:
      return _pageBuilder(
              (_) => BlocProvider(
              create: (_) => sl<RandomJokeBloc>(),
              child: const RandomJokeHome()),
          settings: settings);
  }
}

PageRouteBuilder<dynamic> _pageBuilder(Widget Function(BuildContext) page,
    {required RouteSettings settings}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, _, __) => page(context),
  );
}
