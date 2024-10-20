import 'package:equatable/equatable.dart';

class RandomJoke extends Equatable {
  const RandomJoke(
      {required this.id, required this.joke, required this.status});

  final String id;
  final String joke;
  final int status;

  @override
  List<Object?> get props => [id];
}
