import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diffusion_gui/data/img_fetcher.dart';
import 'package:diffusion_gui/models/photo.dart';
import 'package:diffusion_gui/shared/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final FirstStageConstants firstStageConstants = FirstStageConstants();
  final SecondStageConstants secondStageConstants = SecondStageConstants();
  int index = 0;
  final imageData = getPhotoSet();

  MainBloc() : super(const MainInitial()) {
    on<MainEvent>((event, emit) {
      emit(const MainInitial());
    });

    on<InstructionNavEvent>((event, emit) {
      emit(const InstructionState());
    });

    on<StartEvent>((event, emit) {
      emit(const PhaseOne());
    });

    on<ImageEvent>((event, emit) {
      if (event.phase == 1) {
      } else {}
    });

    on<StartEvent>((event, emit) async {
      await Future.delayed(Duration(seconds: firstStageConstants.initView))
          .then((_) {
            emit(const PhaseOne());
          })
          .then((_) async => await Future.delayed(
                  Duration(seconds: firstStageConstants.wordView))
              .then((_) {}))
          .then((_) async => await Future.delayed(
                  Duration(seconds: firstStageConstants.audioView))
              .then((_) {}));
      emit(const InstructionState());
    });
  }
}
