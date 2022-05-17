import 'dart:math';

import 'package:diffusion_gui/models/photo.dart';

import '../models/photo_set.dart';
import '../models/photo.dart';

List<Photo> getPhotos(String setId) {
  /// TODO getPhotos should retrieve data from supplied setID(folder name)
  List<Photo> photos = [
    Photo(imgName: "assets/set_1/aeroplane.jpg", nameList: ["aeroplane"]),
    Photo(imgName: "assets/set_1/car.jpg", nameList: ["car"]),
    Photo(imgName: "assets/set_1/chocolate.jpg", nameList: ["chocolate"]),
    Photo(imgName: "assets/set_1/dog.jpg", nameList: ["dog"]),
    Photo(imgName: "assets/set_1/grapes.jpg", nameList: ["grapes"]),
    Photo(imgName: "assets/set_1/merlion.jpg", nameList: ["merlion"]),
    Photo(imgName: "assets/set_1/penguin.jpg", nameList: ["penguin"]),
    Photo(imgName: "assets/set_1/perfume.jpg", nameList: ["perfume"]),
    Photo(imgName: "assets/set_1/tomato.jpg", nameList: ["tomato"]),
    Photo(imgName: "assets/set_1/violin.jpg", nameList: ["violin"]),
    Photo(imgName: "assets/set_1/water.jpg", nameList: ["water"]),
    Photo(imgName: "assets/set_1/zebra.jpg", nameList: ["zebra"]),
  ];
  return photos;
}

String getSetID(){
  /// Seed set to 1234 for test
  var rng = Random(1234);
  rng.nextInt(4);
  var setList = ["set_1", "set_2", "set_3", "set_4"];
  return "set_1";
}

PhotoSet getPhotoSet() {
  String setID = getSetID();
  return PhotoSet(setID: setID, set: getPhotos(setID));
}