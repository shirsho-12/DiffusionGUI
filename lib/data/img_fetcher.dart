import 'package:diffusion_gui/models/photo.dart';
import 'package:diffusion_gui/shared/constants.dart';

import '../models/photo.dart';

List<Photo> getPhotos(String setId) {
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

class PhotoSet {
  final String setID;
  final List<Photo> set;

  PhotoSet({required this.setID, required this.set});
}

PhotoSet getPhotoSet() {
  String setID = PhaseConstants().photoSetID;
  return PhotoSet(setID: setID, set: getPhotos(setID));
}
