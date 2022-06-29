part of 'phase_bloc.dart';

@immutable
abstract class PhaseState extends Equatable {
  const PhaseState();

  @override
  List<Object?> get props => [];
}

// initialize
class PhaseInitial extends PhaseState {
  const PhaseInitial();
}

// phase one
class PhaseOne extends PhaseState {
  final bool showImage;
  final bool showText;
  final bool showAudio;
  final Photo photo;
  final int time;
  const PhaseOne({
    required this.showImage,
    required this.showText,
    required this.showAudio,
    required this.photo,
    required this.time,
  });

  @override
  List<Object?> get props => [showImage, showText, showAudio, photo];

  @override
  String toString() {
    return 'PhaseOne{showImage: $showImage, showText: $showText, showAudio: $showAudio, time: $time}';
  }
}

class PhaseTwo extends PhaseState {
  final bool showScreen;
  final Photo photo;

  const PhaseTwo({
    required this.showScreen,
    required this.photo,
  });

  @override
  List<Object?> get props => [showScreen, photo];
}

class PhaseBreak extends PhaseState {
  const PhaseBreak();
}

class PhaseEnd extends PhaseState {
  const PhaseEnd();
}
