
import 'dart:async';

import 'package:diffusion_gui/models/photo.dart';
import 'package:diffusion_gui/shared/constants.dart';

class PhotoSet {
  final String? setID;
  final List<Photo>? set;

  StreamController<Photo?> _controller = StreamController<Photo?>();
  var _index = 0;
  var _repeat = 0;
  var totalIndex = 0;
  final constants = FirstStageConstants();

  PhotoSet({this.setID, this.set}) {
    set!.shuffle();
    // _controller.sink.add(set![0]);
  }

  void stageOneController() {
    Timer.periodic(Duration(seconds: constants.totalTime), (timer)
    {
      // _controller.sink.add(set![_index]);
      addPhoto();
      _index++;
      totalIndex++;
      if (_index == 11) {
        timer.cancel();
      }
    }
    );
  }

  void resetController() {
    _controller = StreamController<Photo?>();
  }

  void addPhoto() async {
    _controller.sink.add(null);
    await Future.delayed(Duration(seconds: constants.loadTime),
            () => _controller.sink.add(set![_index]));
  }

  void breakTime() async {
    Timer(Duration(seconds: constants.breakTime), () {});
}


  void stageTwoController() {
    SecondStageConstants stageTwoConstants = SecondStageConstants();
    Timer.periodic(Duration(seconds: stageTwoConstants.viewTime), (timer) {
      // _controller.sink.add(set![_index]);
      addPhoto();
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
    _index = 0;
    stageTwoController();
    return _controller.stream;
  }

}