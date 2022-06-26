import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

class DatabaseService {

  final String? uid;

  DatabaseService({this.uid});

  final CollectionReferencePlatform imageSetCollection = FirebaseFirestoreWeb()
      .collection("image_set");

  /// TODO: Upload a collection for 4 image set collections
  /// TODO: Get all 4 image set tags
  /// TODO: get a stream of the selected image set
}