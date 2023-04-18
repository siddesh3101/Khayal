import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SmileyFace extends StatefulWidget {
  @override
  _SmileyFaceState createState() => _SmileyFaceState();
}

class _SmileyFaceState extends State<SmileyFace> {
  RiveAnimationController? _controller;
  // final _controller = SimpleAnimation('idle');
  final _speech = stt.SpeechToText();
  bool _isListening = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'speaking',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  void _toggleListening() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() {
          _isListening = true;
        });
        _speech.listen(
          onResult: (result) {
            print(result);
            String command = result.recognizedWords.toLowerCase();
            if (command.contains('smile')) {
              print(command.contains('smile'));
              _controller!.isActive = true;

              // setState(
              //   () {
              //     print('inside set state');
              //   },
              // );
            }
            // _speech.stop();
          },
        );
      }
    } else {
      setState(() {
        _isListening = false;
      });
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smiley Face'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: RiveAnimation.asset(
              'assets/rive/talking_animation.riv',
              animations: const ['idle', 'curves'],
              controllers: [_controller!],
              // onInit: (p0) => setState(() {}),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _toggleListening,
            child: Text(_isListening ? 'Stop listening' : 'Start listening'),
          ),
        ],
      ),
    );
  }
}
