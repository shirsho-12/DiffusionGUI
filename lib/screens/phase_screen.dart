import 'dart:developer' as devtools show log;
import 'package:diffusion_gui/shared/app_bar.dart';
import 'package:diffusion_gui/exports.dart';
import 'package:diffusion_gui/shared/constants.dart';

import 'package:diffusion_gui/screens/phase_boxes.dart';

class PhasePage extends StatefulWidget {
  const PhasePage({Key? key}) : super(key: key);

  @override
  State<PhasePage> createState() => _PhasePageState();
}

class _PhasePageState extends State<PhasePage> {
  final constants = PhaseConstants();

  @override
  Widget build(BuildContext context) {
    /// The widgets will be created with a FutureBuilder method, with the future
    /// being the ones created above

    // ignore: unnecessary_new
    final _ = new PhaseBloc();
    context.read<PhaseBloc>().add(const StartEvent());
    return Scaffold(
      appBar: screenAppBar(),
      body: BlocBuilder<PhaseBloc, PhaseState>(
        buildWhen: (previous, current) => previous.props != current.props,
        builder: (context, state) {
          if (state is PhaseOne) {
            devtools.log(state.toString());
            return PhaseOneBox(
                showImage: state.showImage,
                showWord: state.showWord,
                showAudio: state.showAudio,
                photo: state.photo);
          } else if (state is PhaseBreak) {
            return const PhaseBreakBox();
          } else if (state is BetweenPhase) {
            return const BetweenPhaseBox();
          } else if (state is PhaseTwo) {
            return PhaseTwoBox(
                photo: state.photo, showScreen: state.showScreen);
          } else if (state is PhaseEnd) {
            return const ThankYouBox();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
