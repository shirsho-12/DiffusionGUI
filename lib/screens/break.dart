import 'package:diffusion_gui/screens/phase_1/builder_functions.dart';
import 'package:diffusion_gui/screens/phase_2/phase_two.dart';
import 'package:diffusion_gui/shared/constants.dart';
import 'package:flutter/material.dart';


class Break extends StatelessWidget {
  const Break({Key? key}) : super(key: key);

  Widget next() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: FirstStageConstants().breakTime), () {}),
        initialData: null,
        builder: (builder, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text("Break", style: TextStyle(fontSize: 120.0)),]);
            default:
              return next();
          }
        }
    );
  }
}

class BreakOne extends Break {
  const BreakOne({Key? key}) : super(key: key);

  @override
  Widget next() {
    return getPhaseOneStream(const BreakTwo());
  }
}

class BreakTwo extends Break {
  const BreakTwo({Key? key}) : super(key: key);

  @override
  Widget next() {
    return const PhaseTwo();
  }
}

