import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import '../common_widgets/app_text.dart';
import '../themes/theme.dart';

class QuestionScreen extends StatefulWidget {
  final List<Map<String, dynamic>> questions;
  final List<TextEditingController> editingController;

  const QuestionScreen(
      {required this.questions, required this.editingController});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final int _duration = 10;
  final CountDownController _controller = CountDownController();
  int _currentQuestionIndex = 0;
  double _progressValue = 0.0;

  void _handleNextButtonPressed() {
    setState(() {
      _currentQuestionIndex++;
      _progressValue = (_currentQuestionIndex + 1) / widget.questions.length;
    });
  }

  void _handlePreviousButtonPressed() {
    setState(() {
      _currentQuestionIndex--;
      _progressValue = (_currentQuestionIndex + 1) / widget.questions.length;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Question Screen'),
      // ),
      body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LinearProgressIndicator(
                    value: _progressValue,
                    color: Colors.amber,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 16, right: 5),
                    child: AppText.normalText(
                      widget.questions[_currentQuestionIndex]["question"],
                      fontSize: 18,
                      isBold: true,
                      textAlign: TextAlign.left,
                      color: AppTheme.of(context).theme.headerTextColor,
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  if (widget.questions[_currentQuestionIndex]["activity"] ==
                      "yes")
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          _controller.start();
                        },
                        child: CircularCountDownTimer(
                          duration: _duration,
                          initialDuration: 0,
                          controller: _controller,
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 3,
                          ringColor: Colors.grey[300]!,
                          ringGradient: null,
                          fillColor: Colors.blue[100]!,
                          fillGradient: null,
                          backgroundColor: Color.fromARGB(255, 184, 208, 251),
                          backgroundGradient: null,
                          strokeWidth: 10.0,
                          strokeCap: StrokeCap.round,
                          textStyle: TextStyle(
                              fontSize: 33.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textFormat: CountdownTextFormat.S,
                          isReverse: false,
                          isReverseAnimation: false,
                          isTimerTextShown: true,
                          autoStart: false,
                          // onStart: () {
                          //   _controller.start();
                          // },
                          onComplete: () {
                            _controller.reset();
                          },
                          onChange: (String timeStamp) {
                            debugPrint('Countdown Changed $timeStamp');
                          },
                          timeFormatterFunction:
                              (defaultFormatterFunction, duration) {
                            if (duration.inSeconds == 0) {
                              return "Start";
                            } else {
                              return Function.apply(
                                  defaultFormatterFunction, [duration]);
                            }
                          },
                        ),
                      ),
                    ),
                  if (widget.questions[_currentQuestionIndex]["activity"] ==
                      "no")
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: TextField(
                          controller:
                              widget.editingController[_currentQuestionIndex],
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "I always find this technique..")),
                      // child: AppText.normalText(
                      //   "I always find this technique..",
                      //   fontSize: 20,
                      //   color: AppTheme.of(context).theme.bodyTextColor,
                      // ),
                    ),
                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: Text(
                  //     widget.questions[_currentQuestionIndex]["question"],
                  //     style: TextStyle(fontSize: 24),
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   onPressed: _handleNextButtonPressed,
                  //   child: Text('Next'),
                  // ),
                ],
              ),
              Positioned(
                  bottom: 15,
                  left: 15,
                  child: InkWell(
                      onTap: _currentQuestionIndex == 0
                          ? null
                          : _handlePreviousButtonPressed,
                      child: Icon(Icons.arrow_back_ios))),
              Positioned(
                  bottom: 15,
                  right: 15,
                  child: InkWell(
                      onTap:
                          _currentQuestionIndex == widget.questions.length - 1
                              ? null
                              : _handleNextButtonPressed,
                      child: Icon(Icons.arrow_forward_ios))),
              if (widget.questions[_currentQuestionIndex]["activity"] == "yes")
                Positioned(
                    bottom: 15,
                    right: 200,
                    child:
                        InkWell(onTap: () {}, child: Icon(Icons.watch_later))),
              if (widget.questions[_currentQuestionIndex]["activity"] == "yes")
                Positioned(
                    bottom: 15,
                    right: 120,
                    child: InkWell(onTap: () {}, child: Icon(Icons.skip_next))),
              if (widget.questions[_currentQuestionIndex]["activity"] == "yes")
                Positioned(
                    bottom: 15,
                    right: 160,
                    child: InkWell(onTap: () {}, child: Icon(Icons.done))),
            ],
          )),
    );
  }
}
