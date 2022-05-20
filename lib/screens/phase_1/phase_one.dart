import 'package:diffusion_gui/data/img_fetcher.dart';
import 'package:diffusion_gui/models/photo.dart';
import 'package:diffusion_gui/models/photo_set.dart';
import 'package:diffusion_gui/screens/break.dart';
import 'package:provider/provider.dart';

import 'package:diffusion_gui/shared/constants.dart';
import 'package:diffusion_gui/shared/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'builder_functions.dart';


class PhaseOne extends StatefulWidget {
  final Break nextDestination;

  const PhaseOne({required this.nextDestination, Key? key}) : super(key: key);

  @override
  State<PhaseOne> createState() => _PhaseOneState();
}

class _PhaseOneState extends State<PhaseOne> {

  final PhotoSet imageData = getPhotoSet();

  // Timer
  var index = 0;

  Widget emptyContainer() {
    index++;
    return index == 12 ? widget.nextDestination : Container();
  }

  @override
  Widget build(BuildContext context) {
    /// The widgets will be created with a FutureBuilder method, with the future
    /// being the ones created above

    String imageWord;
    final photo = Provider.of<Photo?>(context);
    photo == null ? imageWord = "" :
      imageWord = photo.nameList.last.toTitleCase();
    print(imageWord + " " + index.toString());
    return photo == null ? emptyContainer() : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15.0, width: 30.0),
                FutureBuilder(
                  future: getTextBox(imageWord),
                  builder: (context, AsyncSnapshot<Widget> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting: return const SizedBox(height: 40.0,);
                      default:
                        return snapshot.data!;
                    }
                  }
                ),
                FutureBuilder(
                  future: getAudioCue(imageWord),
                  builder: (context, AsyncSnapshot<Widget> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting: return const SizedBox(height: 40.0, width: 48.0);
                      default:
                        return snapshot.data!;
                    }
                  }
                ),
              ],
            ),
          const SizedBox(height: 20.0,),
          PhotoBox(imagePath: (photo.imgName!)),
          ],
        ),
      );
  }
}
