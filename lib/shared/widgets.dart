import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoBox extends StatelessWidget {
  final String imagePath;
  const PhotoBox({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// TODO: Change AssetImage to a loader from cloud Storage
    var v = MediaQuery.of(context).size.height  * 3 / 4;
    if (v > 768) {
      v = 768.0;
    } else if (v < 600) {
      v = 600.0;
    }
    final imageHeight = v;

    v = MediaQuery.of(context).size.width  * 3 / 4;
    if (v > 1366) {
      v = 1366.0;
    } else if (v < 800) {
      v = 800.0;
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


class RoutingButton extends StatelessWidget {
  final String buttonText;
  final Widget path;

  const RoutingButton({required this.buttonText, required this.path, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var v = MediaQuery.of(context).size.width / 20;
    if (v > 40) {
      v = 40;
    } else if (v < 15) {
      v = 15;
    }
    final textSize = v;

    return ElevatedButton(
      onPressed: () => Get.to(() => path),
      child: Text(
        "Instructions",
        style: TextStyle(color: Colors.black,
            fontSize: textSize),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.lightBlueAccent[300],
      ),
    );
  }
}
