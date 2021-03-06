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

class ShowWordEvent extends PhaseEvent {
  const ShowWordEvent({required int duration}) : super(duration: duration);
}

class ShowAudioEvent extends PhaseEvent {
  const ShowAudioEvent({required int duration}) : super(duration: duration);
}

class PauseEvent extends PhaseEvent {
  const PauseEvent({required int duration}) : super(duration: duration);
}

class PhaseChangeEvent extends PhaseEvent {
  const PhaseChangeEvent({required int duration}) : super(duration: duration);
}

class SecondShowNothingEvent extends PhaseEvent {
  const SecondShowNothingEvent({required int duration})
      : super(duration: duration);
}

class ShowFormEvent extends PhaseEvent {
  const ShowFormEvent({required int duration}) : super(duration: duration);
}

// user submits answer, actions should proceed instantly
class FormSubmissionEvent extends PhaseEvent {
  final String userInputWord;
  final String photoPath;
  const FormSubmissionEvent(
      {required this.photoPath, required this.userInputWord})
      : super(duration: 0);
}
