import 'package:flutter/material.dart';

class JokeStatsItem extends StatelessWidget {
  final String statName;
  final int statValue;

  const JokeStatsItem(
      {super.key, required this.statName, required this.statValue});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$statName : ",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            statValue.toString(),
            style: const TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
