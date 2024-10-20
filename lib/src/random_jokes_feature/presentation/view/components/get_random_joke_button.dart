import 'package:flutter/material.dart';

class GetRandomJokeButton extends StatelessWidget {
  const GetRandomJokeButton({super.key, required this.onButtonClicked});

  final VoidCallback onButtonClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 82,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            padding: const EdgeInsets.all(20),
            elevation: 10,
          ),
          onPressed: () => onButtonClicked(),
          child: const Text("Get Random Joke",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ));
  }
}
