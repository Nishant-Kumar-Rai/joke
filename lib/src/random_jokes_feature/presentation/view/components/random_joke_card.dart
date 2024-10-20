import 'package:flutter/material.dart';

class RandomJokeCard extends StatelessWidget {
  const RandomJokeCard({super.key, required this.joke});

  final String joke;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          semanticContainer: true,
          shadowColor: Colors.amber,
          elevation: 10,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Text(
              joke,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
