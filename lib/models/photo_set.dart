
import 'dart:async';

import 'package:diffusion_gui/models/photo.dart';
import 'package:diffusion_gui/shared/constants.dart';

class PhotoSet {
  final String? setID;
  final List<Photo>? set;
  int _index = 1;

  StreamController<Photo?> _controller = StreamController<Photo?>();
  final constants = FirstStageConstants();

  PhotoSet({this.setID, this.set}) {
    set!.shuffle();
    // _controller.sink.add(set![0]);
  }

  void stageOneController() {
    Timer.periodic(Duration(seconds: constants.totalTime), (timer) {
      addPhoto(_index);
      _index++;
      if (_index == 13) {
        timer.cancel();
      }
    }
    );
    // addPhoto(12);
  }

  void resetController() {
    _controller = StreamController<Photo?>();
  }

  void addPhoto(int _index) async {
    _controller.sink.add(null);
    await Future.delayed(Duration(seconds: constants.loadTime),
            () => _controller.sink.add(_index > 11 ? null : set![_index]));
  }

  void breakTime() async {
    Timer(Duration(seconds: constants.breakTime), () {});
}


  void stageTwoController() {
    SecondStageConstants stageTwoConstants = SecondStageConstants();
    Timer.periodic(Duration(seconds: stageTwoConstants.viewTime), (timer) {
      // _controller.sink.add(set![_index]);
      addPhoto(_index);
      _index++;
      if (_index == stageTwoConstants.numPhotos - 1) {
        _index = 0;
        timer.cancel();
      }
    });
  }

  Photo initValue() => set![0];
  Stream<Photo?> get stageOneStream {
    stageOneController();
    return _controller.stream;
  }

  Stream<Photo?> get stageTwoStream {
    stageTwoController();
    return _controller.stream;
  }

}