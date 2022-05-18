
import 'dart:async';

import 'package:diffusion_gui/models/photo.dart';
import 'package:diffusion_gui/shared/constants.dart';

class PhotoSet {
  final String? setID;
  final List<Photo>? set;

  final _controller = StreamController<Photo>();
  var _index = 1;

  PhotoSet({this.setID, this.set}) {
    final constants = FirstStageConstants();
    _controller.sink.add(set![0]);
    Timer.periodic(Duration(seconds: constants.totalTime), (timer) {
      _controller.sink.add(set![_index]);
      _index++;
      if (_index == 12) timer.cancel();
    });
  }

  Stream<Photo> get stream => _controller.stream;

}