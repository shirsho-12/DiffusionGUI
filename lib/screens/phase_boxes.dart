import 'package:diffusion_gui/models/photo.dart';
import 'package:diffusion_gui/shared/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

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
                          onFieldSubmitted: (val) => _handleSubmit,
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
                PhotoBox(imagePath: (widget.photo.imgName!)),
              ],
            ),
          );
  }

  void _handleSubmit() {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid ?? false) {
      _formKey.currentState?.save();
      setState(() {
        if (_controller.text.trim().isNotEmpty) {
          widget.photo.nameList.add(_controller.text.trim());
          _formKey.currentState?.save();
          devtools.log(widget.photo.nameList.toString());
          // index++,
          // if (index == constants.numPhotos)
          //   Navigator.pushNamedAndRemoveUntil(
          //       context, thankYouRoute, (route) => false),
        }
      });
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
