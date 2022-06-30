import 'package:diffusion_gui/models/photo.dart';
import 'package:diffusion_gui/shared/widgets.dart';
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
  @override
  Widget build(BuildContext context) {
    /// The widgets will be created with a FutureBuilder method, with the future
    /// being the ones created above

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
                showText: state.showText,
                showAudio: state.showAudio,
                photo: state.photo);
          } else if (state is PhaseBreak) {
            return const PhaseBreakBox();
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

class PhaseOneBox extends StatelessWidget {
  const PhaseOneBox({
    Key? key,
    required this.showImage,
    required this.showText,
    required this.showAudio,
    required this.photo,
  }) : super(key: key);
  final bool showImage;
  final bool showText;
  final bool showAudio;
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final imageWord = photo.nameList.last.toTitleCase();
    devtools.log(imageWord);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15.0, width: 30.0),
              showText ? getTextBox(imageWord) : const SizedBox(height: 40.0),
              showAudio
                  ? getAudioCue(imageWord)
                  : const SizedBox(height: 40.0, width: 48.0),
            ],
          ),
          const SizedBox(height: 20.0),
          showImage
              ? PhotoBox(imagePath: (photo.imgName!))
              : const SizedBox(height: 200.0),
        ],
      ),
    );
  }
}
