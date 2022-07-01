import 'dart:async';
import 'dart:io';

import 'package:diffusion_gui/crud/crud_exceptions.dart';
import 'package:diffusion_gui/crud/database_photo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_windows/path_provider_windows.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' show join;
import 'dart:developer' as devtools show log;

extension Filter<T> on Stream<List<T>> {
  Stream<List<T>> filter(bool Function(T) where) =>
      map((event) => event.where(where).toList());
}

class PhotoService {
  Database? _db;
  final List<DatabasePhoto> _photos = [];

  DatabasePhotoSet? _photoSet;

  static final PhotoService _instance = PhotoService._sharedInstance();
  PhotoService._sharedInstance();
  factory PhotoService() => _instance;

  Future<void> _ensureDbIsOpen() async {
    try {
      await open();
    } on DatabaseAlreadyOpenException {
      // empty
    }
  }

  // get all photos
  Future<Iterable<DatabasePhoto>> getAllPhotos() async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final photos = await db.query(photoSetTable);

    return photos.map((photoRow) => DatabasePhoto.fromRow(photoRow));
  }

  // C in CRUD

  // add photo to set
  Future<DatabasePhotoSet> addPhoto({
    required int setId,
    required String photoPath,
  }) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final id = await db.insert(photoSetTable, {
      setIdColumn: setId,
      photoPathColumn: photoPath,
    });
    return DatabasePhotoSet(id: id, setId: setId, photoPath: photoPath);
  }

  // add word to photo
  Future<DatabasePhoto> addWord({
    required int setId,
    required String photoPath,
    required String word,
  }) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final id = await db.insert(photoTable, {
      setIdColumn: setId,
      photoPathColumn: photoPath,
      wordColumn: word,
    });
    return DatabasePhoto(
        id: id, setId: setId, photoPath: photoPath, word: word);
  }

  // R in CRUD

  // get all photos of a particular set
  Future<List<DatabasePhotoSet>> getPhotoSet({required int setId}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final photos = await db
        .query(photoSetTable, where: '$setIdColumn = ?', whereArgs: [setId]);
    if (photos.isEmpty) {
      throw UnableToGetPhotoSetException();
    }
    return photos.map((photo) => DatabasePhotoSet.fromRow(photo)).toList();
  }

  // get the last word
  Future<DatabasePhoto> getLastPhotoWord({required String photoPath}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final photos = await db.query(
      photoTable,
      where: '$photoPathColumn = ?',
      whereArgs: [photoPath],
      orderBy: '$idColumn DESC',
    );
    if (photos.isEmpty) {
      throw UnableToGetPhotoException();
    } else {
      final photo = DatabasePhoto.fromRow(photos.first);
      return photo;
    }
  }

  // U in CRUD - no update operations, insertions only

  // D in CRUD - no delete operations necessary, just in case

  // deletes all photos in a set
  Future<void> deleteSet({required int setId}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deleteCount = await db.delete(
      photoSetTable,
      where: '$setIdColumn = ?',
      whereArgs: [setId],
    );
    if (deleteCount == 0) {
      throw UnableToDeletePhotoSetException();
    }
  }

  // deletes one photo from the set
  Future<void> deletePhoto({required String photoPath}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deleteCount = await db.delete(
      photoSetTable,
      where: '$photoPathColumn = ?',
      whereArgs: [photoPath],
    );
    // await db.delete(photoTable,
    //     where: '$photoPathColumn = ?', whereArgs: [photoPath]);
    if (deleteCount != 1) {
      throw UnableToDeletePhotoException();
    }
  }

  Database _getDatabaseOrThrow() {
    if (_db == null) {
      throw DatabaseIsClosedException();
    }
    return _db!;
  }

  Future<void> open() async {
    if (_db != null) {
      throw DatabaseAlreadyOpenException();
    }
    try {
      if (Platform.isWindows) {
        devtools.log(Platform.operatingSystem);
        PathProviderWindows.registerWith();
      }

      final docPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docPath.path, dbName);
      Database db;
      if (Platform.isWindows) {
        db = await databaseFactoryFfi.openDatabase(dbPath);
      } else {
        db = await openDatabase(dbPath);
      }

      _db = db;
      final table = await db.query('sqlite_master',
          where: 'name = ?', whereArgs: [photoSetTable]);
      // devtools.log(table.toString());
      // if (table.isEmpty) {
      await _createTable(db);
      // }
      // await _cachePhotos();
    } on MissingPlatformDirectoryException {
      devtools.log("Exception thrown here");
      throw UnableToGetPhotoSetException();
    }
  }

  Future<void> _createTable(Database db) async {
    try {
      // these two lines are run for testing purposes
      await db.execute("DROP TABLE $photoTable;");
      await db.execute("DROP TABLE $photoSetTable;");
      await db.execute(createPhotoSetTable);
      await db.execute(createPhotoTable);
      for (int i = 1; i <= 4; i++) {
        final dir = Directory('assets/set_$i/');
        // devtools.log(dir.toString());
        final List<FileSystemEntity> entities = await dir.list().toList();
        for (FileSystemEntity photoPath in entities) {
          final path = photoPath.path;
          await addPhoto(setId: i, photoPath: path);
          final word = path.split('/').last.split('.').first;
          devtools.log(path);
          devtools.log(word);
          await addWord(setId: i, photoPath: path, word: word);
        }
      }
    } catch (e) {
      devtools.log(e.toString());
      rethrow;
    }
  }

  Future<void> close() async {
    final db = _db;
    if (db == null) {
      throw DatabaseIsClosedException();
    } else {
      await db.close();
      _db == null;
    }
  }
}
