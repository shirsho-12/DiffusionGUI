import 'package:diffusion_gui/models/photo.dart';
import 'package:diffusion_gui/shared/constants.dart';
import 'package:diffusion_gui/shared/widgets.dart';
import 'dart:developer' as devtools show log;
import 'package:diffusion_gui/exports.dart';

class PhaseOneBox extends StatelessWidget {
  const PhaseOneBox({
    Key? key,
    required this.showImage,
    required this.showWord,
    required this.showAudio,
    required this.photo,
  }) : super(key: key);
  final bool showImage;
  final bool showWord;
  final bool showAudio;
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final imageWord = photo.word.toTitleCase();
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
              showWord
                  ? TextBox(text: imageWord)
                  : const SizedBox(height: 40.0),
              showAudio
                  ? AudioCue(text: imageWord)
                  : const SizedBox(height: 40.0, width: 48.0),
            ],
          ),
          const SizedBox(height: 20.0),
          showImage
              ? PhotoBox(imagePath: (photo.photoPath))
              : const SizedBox(height: 200.0),
        ],
      ),
    );
  }
}

class PhaseBreakBox extends StatelessWidget {
  const PhaseBreakBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Break",
        style: TextStyle(fontSize: 120.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class PhaseTwoBox extends StatefulWidget {
  const PhaseTwoBox({
    required this.photo,
    required this.showScreen,
    Key? key,
  }) : super(key: key);

  final Photo photo;
  final bool showScreen;

  @override
  State<PhaseTwoBox> createState() => _PhaseTwoBoxState();
}

class _PhaseTwoBoxState extends State<PhaseTwoBox> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !widget.showScreen
        ? Container()
        : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Form(
                  key: _formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width:
                            MediaQuery.of(context).size.width > 550 ? 450 : 200,
                        child: TextFormField(
                          controller: _controller,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.pink, width: 1)),
                          ),
                          onFieldSubmitted: (val) => _handleSubmit(),
                        ),
                      ),
                      IconButton(
                          onPressed: _handleSubmit,
                          icon: const Icon(Icons.send)),
                      const SizedBox(width: 16.0),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                PhotoBox(imagePath: (widget.photo.photoPath)),
              ],
            ),
          );
  }

  void _handleSubmit() {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid ?? false) {
      // _formKey.currentState?.save();
      if (_controller.text.trim().isNotEmpty) {
        // widget.photo.word.add(_controller.text.trim());
        devtools.log(_controller.text.trim());
        context.read<PhaseBloc>().add(FormSubmissionEvent(
            photoPath: widget.photo.photoPath,
            userInputWord: _controller.text.trim().toLowerCase()));
        _controller.clear();
        // index++,
        // if (index == constants.numPhotos)
        //   Navigator.pushNamedAndRemoveUntil(
        //       context, thankYouRoute, (route) => false),
      }
    }
  }
}

class ThankYouBox extends StatelessWidget {
  const ThankYouBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Thank you participating.",
        style: TextStyle(fontSize: 120.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class BetweenPhaseBox extends StatelessWidget {
  const BetweenPhaseBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Phase Two",
        style: TextStyle(fontSize: 120.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
