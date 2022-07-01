import 'package:diffusion_gui/crud/photo_service.dart';
import 'package:diffusion_gui/models/photo.dart';
import 'dart:developer' as devtools show log;

import '../models/photo.dart';

class PhotoSet {
  final _photoService = PhotoService();

  Future<List<Photo>> getPhotos(String setId) {
    List<Photo> photos = [
      Photo(imgName: "assets/set_1/aeroplane.jpg", word: "aeroplane"),
      Photo(imgName: "assets/set_1/car.jpg", word: "car"),
      Photo(imgName: "assets/set_1/chocolate.jpg", word: "chocolate"),
      Photo(imgName: "assets/set_1/dog.jpg", word: "dog"),
      Photo(imgName: "assets/set_1/grapes.jpg", word: "grapes"),
      Photo(imgName: "assets/set_1/merlion.jpg", word: "merlion"),
      Photo(imgName: "assets/set_1/penguin.jpg", word: "penguin"),
      Photo(imgName: "assets/set_1/perfume.jpg", word: "perfume"),
      Photo(imgName: "assets/set_1/tomato.jpg", word: "tomato"),
      Photo(imgName: "assets/set_1/violin.jpg", word: "violin"),
      Photo(imgName: "assets/set_1/water.jpg", word: "water"),
      Photo(imgName: "assets/set_1/zebra.jpg", word: "zebra"),
    ];
    return Future.value(photos);
  }

  Future<List<Photo>> getDatabasePhotos(String setId) async {
    final id = int.parse(setId.split("_").last);
    final databasePhotos = await _photoService.getPhotoSet(setId: id);
    List<Photo> photos = [];
    for (int i = 0; i < databasePhotos.length; i++) {
      final word = await _photoService.getLastPhotoWord(
          photoPath: databasePhotos[i].photoPath);
      devtools.log("PRINTING HERE ${word.photoPath} ${word.word}");
      photos.add(Photo(imgName: databasePhotos[i].photoPath, word: word.word));
    }

    return photos;
  }
}



// class PhotoSet {
//   final String setID;
//   final List<Photo> set;

//   PhotoSet({required this.setID, required this.set});
// }

// PhotoSet getPhotoSet() {
//   String setID = PhaseConstants().photoSetID;
//   return PhotoSet(setID: setID, set: getPhotos(setID));
// }
