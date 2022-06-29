import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:diffusion_gui/bloc/ticker.dart';
import 'package:diffusion_gui/data/img_fetcher.dart';
import 'package:diffusion_gui/models/photo.dart';
import 'package:diffusion_gui/shared/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'dart:developer' as devtools show log;

part 'phase_event.dart';
part 'phase_state.dart';

class PhaseBloc extends Bloc<PhaseEvent, PhaseState> {
  final photos = getPhotos("set_1");
  final constants = PhaseConstants();
  int index = 0;
  int numPhotos = 1;
  bool repeatPhaseOne = false;

  final Ticker ticker = const Ticker();
  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  PhaseBloc() : super(const PhaseInitial()) {
    on<StartEvent>(_onStart);
    on<ShowNothingEvent>(_onShowNothing);
    on<ShowPhotoEvent>(_onShowPhoto);
    on<ShowTextEvent>(_onShowText);
    on<ShowAudioEvent>(_onShowAudio);
    on<WaitEvent>(_onWait);
    on<PhaseChangeEvent>(_onPhaseChange);
    on<SecondShowNothingEvent>(_onSecondShowNothing);
    on<ShowFormEvent>(_onShowForm);
  }

  void _onStart(StartEvent event, Emitter<PhaseState> emit) {
    photos.shuffle();
    emit(PhaseOne(
        showImage: false,
        showText: false,
        showAudio: false,
        photo: photos[index],
        time: constants.breakTime));
    _tickerAction(
        ShowPhotoEvent(duration: constants.initView), constants.breakTime);
  }

  void _onShowNothing(ShowNothingEvent event, Emitter<PhaseState> emit) {
    emit(PhaseOne(
        showImage: false,
        showText: false,
        showAudio: false,
        photo: photos[index],
        time: event.duration));
    _tickerAction(ShowPhotoEvent(duration: constants.initView), event.duration,
        isBreak: true);
  }

  void _onShowPhoto(ShowPhotoEvent event, Emitter<PhaseState> emit) {
    emit(PhaseOne(
        showImage: true,
        showText: false,
        showAudio: false,
        photo: photos[index],
        time: event.duration));
    _tickerAction(ShowTextEvent(duration: constants.wordView), event.duration);
  }

  void _onShowText(ShowTextEvent event, Emitter<PhaseState> emit) {
    emit(PhaseOne(
        showImage: true,
        showText: true,
        showAudio: false,
        photo: photos[index],
        time: event.duration));
    _tickerAction(
        ShowAudioEvent(duration: constants.audioView), event.duration);
  }

  void _onShowAudio(ShowAudioEvent event, Emitter<PhaseState> emit) {
    emit(PhaseOne(
        showImage: true,
        showText: true,
        showAudio: true,
        photo: photos[index],
        time: event.duration));
    _tickerAction(
        ShowNothingEvent(duration: constants.breakTime), event.duration);
  }

  void _onWait(WaitEvent event, Emitter<PhaseState> emit) {
    devtools.log("WaitEvent: ${event.duration} ${event.nextEvent}");
    if (event.duration <= 0) {
      if (event.isBreak) {
        // if this is a break, then we need increment the index
        index++;
        if (index >= numPhotos) {
          if (repeatPhaseOne) {
            // repeat phase one
            index = 0;
            emit(const PhaseBreak());
            repeatPhaseOne = false;
            photos.shuffle();
            _tickerAction(ShowPhotoEvent(duration: constants.initView),
                constants.breakTime);
            return;
          }
          if (numPhotos == constants.numFormPhotos) {
            // we've already changed phases, so we're done
            emit(const PhaseEnd());
            return;
          }
          // going to the second phase
          index = 0;
          numPhotos = constants.numFormPhotos;
          add(const PhaseChangeEvent());
          return;
        }
      }
      add(event.nextEvent);
    } else {
      devtools.log(index.toString());
    }
  }

  void _onPhaseChange(PhaseChangeEvent event, Emitter<PhaseState> emit) {
    photos.shuffle();
    emit(PhaseTwo(showScreen: true, photo: photos[index]));
    _tickerAction(SecondShowNothingEvent(duration: constants.phaseTwoBreakTime),
        constants.formViewTime);
  }

  void _onSecondShowNothing(
      SecondShowNothingEvent event, Emitter<PhaseState> emit) {
    emit(PhaseTwo(showScreen: false, photo: photos[index]));
    _tickerAction(
        ShowFormEvent(duration: constants.formViewTime), event.duration,
        isBreak: true);
  }

  void _onShowForm(ShowFormEvent event, Emitter<PhaseState> emit) {
    emit(PhaseTwo(showScreen: true, photo: photos[index]));
    _tickerAction(SecondShowNothingEvent(duration: constants.phaseTwoBreakTime),
        event.duration);
  }

  void _tickerAction(PhaseEvent nextEvent, int time, {bool isBreak = false}) {
    _tickerSubscription?.cancel();
    _tickerSubscription = ticker.tick(ticks: time).listen((duration) => add(
        WaitEvent(duration: duration, nextEvent: nextEvent, isBreak: isBreak)));
  }
}