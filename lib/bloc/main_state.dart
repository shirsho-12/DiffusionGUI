part of 'main_bloc.dart';

@immutable
abstract class MainState {
  const MainState();
}

// app on open
class MainInitial extends MainState {
  const MainInitial();
}

// instructions page
class InstructionState extends MainState {
  const InstructionState();
}

// phase one
class PhaseOne extends MainState {
  const PhaseOne();
}

// phase one show image
class PhaseOneImage extends PhaseOne {
  final Photo photo;
  const PhaseOneImage({required this.photo});
}

// between image break
class PhaseOneBreak extends PhaseOne {
  const PhaseOneBreak();
}

// phase two
class PhaseTwo extends MainState {
  const PhaseTwo();
}

// phase two show image
class PhaseTwoImage extends PhaseTwo {
  final Photo photo;
  const PhaseTwoImage({required this.photo});
}

// phase two break
class PhaseTwoBreak extends PhaseTwo {
  const PhaseTwoBreak();
}
