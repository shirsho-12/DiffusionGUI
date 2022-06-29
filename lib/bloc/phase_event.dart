part of 'phase_bloc.dart';

@immutable
abstract class PhaseEvent extends Equatable {
  final int duration;
  const PhaseEvent({required this.duration});

  @override
  List<Object?> get props => [];
}

class StartEvent extends PhaseEvent {
  const StartEvent() : super(duration: 0);
}

class ShowNothingEvent extends PhaseEvent {
  const ShowNothingEvent({required int duration}) : super(duration: duration);
}

class WaitEvent extends PhaseEvent {
  final PhaseEvent nextEvent;
  final bool isBreak;
  const WaitEvent(
      {required this.nextEvent, required int duration, required this.isBreak})
      : super(duration: duration);

  @override
  List<Object?> get props => [duration];
}

class ShowPhotoEvent extends PhaseEvent {
  const ShowPhotoEvent({required int duration}) : super(duration: duration);
}

class ShowTextEvent extends PhaseEvent {
  const ShowTextEvent({required int duration}) : super(duration: duration);
}

class ShowAudioEvent extends PhaseEvent {
  const ShowAudioEvent({required int duration}) : super(duration: duration);
}

class PauseEvent extends PhaseEvent {
  const PauseEvent({required int duration}) : super(duration: duration);
}

class PhaseChangeEvent extends PhaseEvent {
  const PhaseChangeEvent() : super(duration: 0);
}

class SecondShowNothingEvent extends PhaseEvent {
  const SecondShowNothingEvent({required int duration})
      : super(duration: duration);
}

class ShowFormEvent extends PhaseEvent {
  const ShowFormEvent({required int duration}) : super(duration: duration);
}
