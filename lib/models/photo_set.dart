
import 'package:diffusion_gui/models/photo.dart';

class PhotoSet {
  final String? setID;
  final List<Photo>? set;

  PhotoSet({this.setID, this.set});

  Future getPhoto(int idx) async{
    return await set![idx];
  }
}