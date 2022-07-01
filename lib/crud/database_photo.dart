import 'package:diffusion_gui/exports.dart';

@immutable
class DatabasePhotoSet {
  final int id;
  final int setId;
  final String photoPath;

  const DatabasePhotoSet({
    required this.id,
    required this.setId,
    required this.photoPath,
  });

  DatabasePhotoSet.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        setId = map[setIdColumn] as int,
        photoPath = map[photoPathColumn] as String;

  @override
  String toString() {
    return "PhotoSet: ID = $id, setId = $setId, photoPath = $photoPath";
  }

  @override
  bool operator ==(covariant DatabasePhotoSet other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

@immutable
class DatabasePhoto {
  final String photoPath;
  final int setId;
  final String word;
  final int id;

  const DatabasePhoto(
      {required this.id,
      required this.photoPath,
      required this.setId,
      required this.word});

  DatabasePhoto.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        photoPath = map[photoPathColumn] as String,
        setId = map[setIdColumn] as int,
        word = map[wordColumn] as String;

  @override
  String toString() {
    return "Photo: setId = $setId, photoPath = $photoPath, word = $word";
  }

  @override
  bool operator ==(covariant DatabasePhoto other) =>
      photoPath == other.photoPath;

  @override
  int get hashCode => photoPath.hashCode;
}

const dbName = "photos.db";
const photoTable = 'photo';
const photoSetTable = 'photo_set';
const idColumn = 'id';
const setIdColumn = 'set_id';
const photoPathColumn = 'photo_path';
const wordColumn = 'word';

const createPhotoSetTable = '''CREATE TABLE IF NOT EXISTS "photo_set" (
  "$idColumn" INTEGER NOT NULL,
  "$setIdColumn" INTEGER NOT NULL,
  "$photoPathColumn" TEXT NOT NULL UNIQUE,
  PRIMARY KEY("$idColumn" AUTOINCREMENT)  
); ''';

const createPhotoTable = '''CREATE TABLE IF NOT EXISTS "photo" (
  "$idColumn" INTEGER NOT NULL,
  "$photoPathColumn" Text NOT NULL UNIQUE,
  "$setIdColumn" INTEGER NOT NULL,
  "$wordColumn" TEXT NOT NULL,
  PRIMARY KEY("$idColumn" AUTOINCREMENT)
  FOREIGN KEY ("$photoPathColumn" ) REFERENCES "photo_set"("$photoPathColumn") ON DELETE CASCADE
);''';
