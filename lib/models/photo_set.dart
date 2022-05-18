
import 'dart:async';

import 'package:diffusion_gui/models/photo.dart';
import 'package:diffusion_gui/shared/constants.dart';

class PhotoSet {
  final String? setID;
  final List<Photo>? set;

  final _controller = StreamController<Photo>();
  var _index = 0;

  PhotoSet({this.setID, this.set}) {
    final constants = FirstStageConstants();
    Timer.periodic(Duration(seconds: constants.totalTime), (timer) {
      _controller.sink.add(set![_index]);
      _index++;
      if (_index == 12) _controller.close();
    });
  }

  Stream<Photo> get stream => _controller.stream;

  Future getPhoto(int idx) async{
    return await set![idx];
  }
}