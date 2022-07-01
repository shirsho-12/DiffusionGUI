import 'package:diffusion_gui/crud/photo_service.dart';
import 'package:diffusion_gui/models/photo.dart';

import '../models/photo.dart';

class PhotoSet {
  final _photoService = PhotoService();

  Future<List<Photo>> getPhotos(String setId) {
    List<Photo> photos = [
      Photo(photoPath: "assets/set_1/aeroplane.jpg", word: "aeroplane"),
      Photo(photoPath: "assets/set_1/car.jpg", word: "car"),
      Photo(photoPath: "assets/set_1/chocolate.jpg", word: "chocolate"),
      Photo(photoPath: "assets/set_1/dog.jpg", word: "dog"),
      Photo(photoPath: "assets/set_1/grapes.jpg", word: "grapes"),
      Photo(photoPath: "assets/set_1/merlion.jpg", word: "merlion"),
      Photo(photoPath: "assets/set_1/penguin.jpg", word: "penguin"),
      Photo(photoPath: "assets/set_1/perfume.jpg", word: "perfume"),
      Photo(photoPath: "assets/set_1/tomato.jpg", word: "tomato"),
      Photo(photoPath: "assets/set_1/violin.jpg", word: "violin"),
      Photo(photoPath: "assets/set_1/water.jpg", word: "water"),
      Photo(photoPath: "assets/set_1/zebra.jpg", word: "zebra"),
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
      // devtools.log("PRINTING HERE ${word.photoPath} ${word.word}");
      photos
          .add(Photo(photoPath: databasePhotos[i].photoPath, word: word.word));
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
