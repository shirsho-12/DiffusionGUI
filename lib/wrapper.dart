import 'dart:async';

import 'package:diffusion_gui/screens/phase_1/phase_one.dart';
import 'package:diffusion_gui/screens/phase_2/phase_two.dart';
import 'package:diffusion_gui/shared/constants.dart';
import 'package:diffusion_gui/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/img_fetcher.dart';
import 'models/photo.dart';
import 'models/photo_set.dart';

class WrapperOne extends StatefulWidget {
  const WrapperOne({Key? key}) : super(key: key);

  @override
  State<WrapperOne> createState() => _WrapperOneState();
}

class _WrapperOneState extends State<WrapperOne> {

  final PhotoSet imageData = getPhotoSet();

  @override
  Widget build(BuildContext context) {
    // onPressed: () => Get.to(() => const Wrapper()),
    return StreamProvider<Photo?>.value(
        initialData: imageData.initValue(),
    value: imageData.stageOneStream,
    child: const PhaseOne()
    );
  }
}

class WrapperTwo extends StatefulWidget {
  const WrapperTwo({Key? key}) : super(key: key);

  @override
  State<WrapperTwo> createState() => _WrapperTwoState();
}

class _WrapperTwoState extends State<WrapperTwo> {

  final PhotoSet imageData = getPhotoSet();

  @override
  Widget build(BuildContext context) {
    // onPressed: () => Get.to(() => const Wrapper()),
    return StreamProvider<Photo?>.value(
        initialData: imageData.initValue(),
        value: imageData.stageTwoStream,
        child: const PhaseTwo()
    );
  }
}




