import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/src/random_jokes_feature/presentation/bloc/random_joke_bloc.dart';
import 'package:jokes/src/random_jokes_feature/presentation/view/components/circular_progress.dart';
import 'package:jokes/src/random_jokes_feature/presentation/view/components/get_random_joke_button.dart';
import 'package:jokes/src/random_jokes_feature/presentation/view/components/random_joke_card.dart';
import 'package:jokes/src/random_jokes_feature/presentation/view/components/search_box.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/view_helper.dart';

class RandomJokeHome extends StatefulWidget {
  const RandomJokeHome({super.key});

  static const String routeName = "RandomJokeHome";

  @override
  State<RandomJokeHome> createState() => _RandomJokeHomeState();
}

class _RandomJokeHomeState extends State<RandomJokeHome>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  void getRandomJoke() {
    context.read<RandomJokeBloc>().add(const GetRandomJokeEvent());
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    getRandomJoke();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RandomJokeBloc, RandomJokeState>(
        builder: (context, state) {
      return Scaffold(
        body: state is RandomJokeLoading
            ? const LoadingIndicator()
            : state is RandomJokeLoaded
                ? Stack(children: [
                    Container(
                      decoration: headerCardDecoration,
                      height: MediaQuery.of(context).size.height * 0.20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(height: 40),
                          const SearchBar(
                            isEditMode: false,
                            icon: Icons.search,
                            onIconClicked: null,
                            onTextChanged: null,
                          ),
                          RandomJokeCard(
                            joke: state.randomJoke.joke,
                          ),
                          GetRandomJokeButton(
                            onButtonClicked: () {
                              _controller.repeat();
                              getRandomJoke();
                            },
                          ),
                          Lottie.asset(
                            'assets/lottie/laughing.json',
                            controller: _controller,
                            onLoaded: (composition) {
                              _controller
                                ..duration = composition.duration
                                ..forward();
                            },
                          ),
                        ],
                      ),
                    ),
                  ])
                : Container(),
      );
    }, listener: (context, state) async {
      if (state is RandomJokeError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errMessage)));
      }

      if (state is RandomJokeLoaded) {
        await Future.delayed(const Duration(milliseconds: 1500));
        _controller.stop();
      }
    });
  }
}
