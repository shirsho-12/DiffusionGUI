part of 'main_bloc.dart';

@immutable
abstract class MainEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InstructionNavEvent extends MainEvent {}

class StartEvent extends MainEvent {}

class ImageEvent extends MainEvent {
  final int phase;
  final String photoUrl;

  ImageEvent({required this.phase, required this.photoUrl});
  @override
  List<Object?> get props => [phase, photoUrl];
}

class WordEvent extends MainEvent {
  final int phase;
  final String photoUrl;
  final String word;

  WordEvent({required this.phase, required this.photoUrl, required this.word});
  @override
  List<Object?> get props => [phase, photoUrl, word];
}

class AudioEvent extends MainEvent {
  final int phase;
  final String photoUrl;
  final String word;

  AudioEvent({required this.phase, required this.photoUrl, required this.word});
  @override
  List<Object?> get props => [photoUrl, word];
}

class BreakEvent extends MainEvent {
  final int phase;
  BreakEvent({required this.phase});
  @override
  List<Object?> get props => [phase];
}
