import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart' as rv;
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart'
    as sg;
import 'package:speech_to_text/speech_to_text.dart';

import '../../constants/constant.dart';
import '../../providers/chats_provider.dart';
import '../../providers/models_provider.dart';
import '../../services/model_ervices.dart';
import '../../widgets/chat_widget.dart';
import '../../widgets/text_widget.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chat_bot';
  // const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isTyping = false;
  bool _firstText = true;
  rv.RiveAnimationController? _controller;
  // final _controller = SimpleAnimation('idle');
  final _speech = stt.SpeechToText();
  bool _isListening = false;
  bool _isPlaying = false;
  final speechToText = SpeechToText();
  final flutterTts = FlutterTts();
  String lastWords = '';
  // final OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;

  late TextEditingController textEditingController;
  late ScrollController _listScrollController;
  late FocusNode focusNode;
  @override
  void initState() {
    initSpeechToText();
    initTextToSpeech();
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    _controller = rv.OneShotAnimation(
      'speaking',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
    focusNode = FocusNode();
    Timer(Duration(seconds: 10), () {
      setState(() {
        _firstText = false;
      });
    });

    _controller!.isActive = true;
    super.initState();
  }

  Future<void> initTextToSpeech() async {
    await flutterTts.setSharedInstance(true);
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
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
            _controller!.isActive = true;
            // if (command.contains('smile')) {
            //   print(command.contains('smile'));
            //   _controller!.isActive = true;

            //   // setState(
            //   //   () {
            //   //     print('inside set state');
            //   //   },
            //   // );
            // }
            // _speech.stop();
          },
        );
      }
    } else {
      setState(() {
        _controller!.isActive = false;
        _isListening = false;
      });
      _speech.stop();
    }
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    speechToText.stop();
    flutterTts.stop();
    super.dispose();
  }

  // List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    if (chatProvider.chatList.length > 0) {
      _controller!.isActive = true;
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(213, 226, 234, 1),
      // gradient: LinearGradient(
      //   begin: Alignment.bottomLeft,
      //   end: Alignment.topRight,
      //   colors: [
      //     Color(0xFF8EC5FC),
      //     // Color(0xFFE0C3FC),
      //   ],
      // ),

      // drawer: const MainDrawer(),
      // backgroundColor: Colors.amber,

      // appBar: AppBar(
      //   elevation: 2,
      //   // leading: Padding(
      //   //   padding: const EdgeInsets.all(8.0),
      //   //   child: Image.asset(AssetsManager.openaiLogo),
      //   // ),
      //   centerTitle: true,
      //   title: const Text("ChatGPT"),
      //   actions: [
      //     //Image.asset(AssetsManager.openaiLogo,width: 35,),
      //     IconButton(
      //       onPressed: () async {
      //         await Services.showModalSheet(context: context);
      //       },
      //       icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 220,
              child: rv.RiveAnimation.asset(
                'assets/rive/talking_animation.riv',
                animations: const ['idle', 'curves'],
                controllers: [_controller!],
                // onInit: (p0) => setState(() {}),
              ),
            ),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: _toggleListening,
            //   child: Text(_isListening ? 'Stop listening' : 'Start listening'),
            // ),
            Flexible(
              child: ListView.builder(
                  controller: _listScrollController,
                  itemCount: chatProvider.getChatList.length, //chatList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_firstText == false && index == 0)
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            child: Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 62, 90),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: SpinKitThreeBounce(
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        if (_firstText == false && index == 0)
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            child: Container(
                                alignment: Alignment.center,
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 0, 62, 90),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Text(
                                  "Hi Siddesh",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        if (_firstText == false && index == 0)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                                // alignment: Alignment.center,
                                // width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 0, 62, 90),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Good Afternoon",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ),
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: const SpinKitThreeBounce(
                        //     color: Colors.black,
                        //     size: 18,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ChatWidget(
                            msg: chatProvider
                                .getChatList[index].msg, // chatList[index].msg,
                            chatIndex: chatProvider.getChatList[index]
                                .chatIndex, //chatList[index].chatIndex,
                            shouldAnimate:
                                chatProvider.getChatList.length - 1 == index,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.black,
                size: 18,
              ),
            ],
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        focusNode: focusNode,
                        style: const TextStyle(color: Colors.black),
                        controller: textEditingController,
                        onSubmitted: (value) async {
                          await sendMessageFCT(
                              modelsProvider: modelsProvider,
                              chatProvider: chatProvider);
                        },
                        decoration: const InputDecoration.collapsed(
                            hintText: "How can I help you?",
                            hintStyle: TextStyle(color: Colors.black45)),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await sendMessageFCT(
                              modelsProvider: modelsProvider,
                              chatProvider: chatProvider);
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.black45,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT(
      {ModelsProvider? modelsProvider, ChatProvider? chatProvider}) async {
    if (_isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: TextWidget(
            label: "You can't send multiple messages at a time",
          ),
          backgroundColor: Colors.deepOrangeAccent,
        ),
      );
      return;
    }
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "Please type a message",
          ),
          backgroundColor: Colors.deepOrangeAccent,
        ),
      );
      return;
    }
    try {
      String msg = textEditingController.text;
      setState(() {
        _isTyping = true;
        // chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
        chatProvider!.addUserMessage(msg: msg);
        textEditingController.clear();
        focusNode.unfocus();
      });
      await chatProvider!
          .sendJash(msg: msg, chosenModelId: modelsProvider!.getCurrentModel);
      //     .then((value) async {
      //   // await systemSpeak(value[0].msg);

      //   // await stopListening();
      // });
      // chatList.addAll(await ApiService.sendMessage(
      //   message: textEditingController.text,
      //   modelId: modelsProvider.getCurrentModel,
      // ));
      setState(() {});
    } catch (error) {
      log("error $error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollListToEND();
        _isTyping = false;
      });
    }
  }
}
