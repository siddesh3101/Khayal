import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation_app/src/common_widgets/app_text.dart';
import 'package:meditation_app/src/common_widgets/play_music_card.dart';
import 'package:meditation_app/src/screens/home_screen/recommended_card_widget.dart';
import 'package:meditation_app/src/screens/home_screen/recommended_music_dummy_data.dart';
import 'package:meditation_app/src/themes/theme.dart';

import '../chatbot/chat_final.dart';
import 'home_card_widget.dart';

class BookSession extends StatefulWidget {
  const BookSession({Key? key}) : super(key: key);

  @override
  State<BookSession> createState() => _BookSessionState();
}

class _BookSessionState extends State<BookSession> {
  // AudioPlayer audioPlayer = AudioPlayer();

  // Future<void> playBackgroundMusic() async {
  //   await audioPlayer.play('meditation/amitabh.mp3', isLocal: true);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: Stack(
            children: [
              // Positioned(
              //   bottom: 0,
              //   right: 0,
              //   child: SizedBox(
              //     // height: MediaQuery.of(context).size.height,
              //     child: Lottie.network(
              //       'https://assets4.lottiefiles.com/packages/lf20_xcvaucib.json',
              //       fit: BoxFit.fitHeight,
              //       repeat: true,
              //     ),
              //   ),
              // ),
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Center(
                          child: Image.asset(
                            "assets/images/app_logo.png",
                            // semanticsLabel: 'A red up arrow',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    // const SizedBox(height: 40),
                    Image.asset(
                      "assets/images/header.png",
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/upcoming.png",
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                    ),
                    Image.asset(
                      "assets/images/allsessions.png",
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/book.png",
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                    ),
                    Image.asset(
                      "assets/images/rebook.png",
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                    ),
                  ],
                ),
              ),
              // Lottie.network(
              //     'https://assets4.lottiefiles.com/private_files/lf30_Ba6XfL.json'),
            ],
          )),
    );
  }
}
