import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/core/utils/view_helper.dart';
import 'package:jokes/src/random_jokes_feature/presentation/view/components/search_box.dart';
import 'package:jokes/src/search_jokes_feature/presentation/bloc/search_joke_bloc.dart';
import 'package:jokes/src/search_jokes_feature/presentation/view/components/jokes_stats.dart';

import '../../../random_jokes_feature/presentation/view/components/circular_progress.dart';

class SearchJokeScreen extends StatefulWidget {
  const SearchJokeScreen({super.key});

  static const routeName = "SearchJokeScreen";

  @override
  State<SearchJokeScreen> createState() => _SearchJokeScreenState();
}

class _SearchJokeScreenState extends State<SearchJokeScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _isLoading = false;
  bool _isMaxReached = false;
  Timer? _debounce;

  bool get _isBottom {
    if (!_scrollController.hasClients) {
      return false;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onScroll() {
    if (_isBottom && !_isLoading && !_isMaxReached) {
      _isLoading = true;
      context.read<SearchJokeBloc>().add(const OnLoadMore());
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchJokeBloc, SearchJokeState>(
        builder: (context, state) {
      return Scaffold(
        body: Stack(children: [
          Container(
            decoration: headerCardDecoration,
            height: MediaQuery.of(context).size.height * 0.40,
          ),
          Column(mainAxisSize: MainAxisSize.max, children: [
            const SizedBox(height: 40),
            SearchBar(
              isEditMode: true,
              icon: Icons.arrow_back_ios,
              onTextChanged: (value) {
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce = Timer(const Duration(milliseconds: 1000), () {
                  context
                      .read<SearchJokeBloc>()
                      .add(OnStartSearch(searchTerm: value));
                });
              },
              onIconClicked: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 40),
            if (state is SearchJokeLoaded)
              JokeStats(
                  currentPage: (state).resultModel.current_page,
                  totalJokes: (state).resultModel.total_jokes,
                  totalPages: (state).resultModel.total_pages,
                  limit: (state).resultModel.limit,
                  noOfJokesDisplaying: (state).jokeList.length),
            if (state is SearchJokeLoaded)
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  addAutomaticKeepAlives: true,
                  itemCount: state.jokeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(20),
                        key: Key(state.jokeList[index].id),
                        title: Text(
                          state.jokeList[index].joke,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              ),
            if (_isLoading) const CircularProgressIndicator()
          ]),
          if (state is SearchJokeLoading)
            const Center(child: LoadingIndicator()),
        ]),
      );
    }, listener: (context, state) {
      if (state is SearchJokeError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errorMessage)));
      }
      if (state is SearchJokeLoaded) {
        FocusManager.instance.primaryFocus?.unfocus();
        _isLoading = false;
        if (state.jokeList.length == state.resultModel.total_jokes) {
          _isMaxReached = true;
        }
      }
      if (state is SearchJokeLoading) {
        _isMaxReached = false;
      }
    });
  }
}
