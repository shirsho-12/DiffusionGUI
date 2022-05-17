import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:image:image.dart';

class PhotoBox extends StatelessWidget {
  final String imagePath;
  const PhotoBox({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// TODO: Change AssetImage to a loader from cloud Storage
    /// Image.network()
    var v = MediaQuery.of(context).size.height  * 4 / 5;
    if (v > 724) {
      v = 724.0;
    } else if (v < 360) {
      v = 360.0;
    }
    final imageHeight = v;

    v = MediaQuery.of(context).size.width  * 3 / 5;
    if (v > 1024) {
      v = 1024.0;
    } else if (v < 480) {
      v = 480.0;
    }
    final imageWidth = v;
    return Container(
      height: imageHeight,
      width: imageWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
      ),
    );
  }
}
