import 'package:flutter/material.dart';
import 'package:jokes/src/search_jokes_feature/presentation/view/components/joke_stats_item.dart';

class JokeStats extends StatelessWidget {
  const JokeStats(
      {super.key,
      required this.currentPage,
      required this.totalJokes,
      required this.totalPages,
      required this.limit,
      required this.noOfJokesDisplaying});

  final int totalPages;
  final int totalJokes;
  final int currentPage;
  final int limit;
  final int noOfJokesDisplaying;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shadowColor: Colors.amber,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            JokeStatsItem(statName: "Total Pages", statValue: totalPages),
            JokeStatsItem(statName: "Total Jokes", statValue: totalJokes),
            JokeStatsItem(statName: "Current Page", statValue: currentPage),
            JokeStatsItem(statName: "Limit", statValue: limit),
            JokeStatsItem(
                statName: "No Of jokes displayed",
                statValue: noOfJokesDisplaying)
          ],
        ),
      ),
    );
  }
}
