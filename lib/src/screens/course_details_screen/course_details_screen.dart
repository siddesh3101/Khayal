import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/src/common_widgets/app_images.dart';
import 'package:meditation_app/src/common_widgets/app_text.dart';
import 'package:meditation_app/src/common_widgets/favorites_widget.dart';
import 'package:meditation_app/src/common_widgets/listening_widget.dart';

import 'episode_widget.dart';
import 'voices_tab_widget.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  final second = AssetsAudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    assetsAudioPlayer.open(
      Audio("assets/meditation/nature.mp3"),
    );

    super.initState();
  }

  void stopBackgroundMusic() {
    final bool playing = assetsAudioPlayer.isPlaying.value;
    print(playing);
    if (playing) {
      assetsAudioPlayer.stop();
      setState(() {});
    } else {
      assetsAudioPlayer.play();
      setState(() {});
    }
  }

  void stop() {
    second.open(
      Audio("assets/meditation/bodyscan.mp3"),
    );
    final bool playing = second.isPlaying.value;
    print(playing);
    if (playing) {
      second.stop();
      setState(() {});
    } else {
      second.play();
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    assetsAudioPlayer.dispose();
    second.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                AppImages.roundedContainerWithImage(
                  "assets/images/backgrounds/course_background.png",
                  height: 250,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 50,
                          horizontal: 20,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                        )),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.normalText(
                    "Happy Morning",
                    fontSize: 34,
                    isBold: true,
                  ),
                  AppText.normalText("Course",
                      fontSize: 14,
                      isBold: true,
                      color: const Color(0xffA1A4B2)),
                  const SizedBox(
                    height: 20,
                  ),
                  AppText.normalText(
                    "Ease the mind into a "
                    "restful night's sleep with these deep tones",
                    fontSize: 16,
                    color: const Color(0xffA1A4B2),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: const [
                      FavoritesWidget(
                        iconColor: Color(0xffFF84A2),
                        textColor: Color(0xffA1A4B2),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      ListeningWidget(
                        iconColor: Color(0xff67C8C1),
                        textColor: Color(0xffA1A4B2),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  AppText.normalText(
                    "Pick A Narrator",
                    fontSize: 20,
                    isBold: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 500,
                    child: VoicesTab(
                      tabOne: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: stopBackgroundMusic,
                                  child: Icon(
                                    assetsAudioPlayer.isPlaying.value
                                        ? Icons.pause
                                        : Icons.play_circle_fill,
                                    size: 40,
                                    color: Color(0xff8E97FD),
                                  ),
                                ),
                                // getPlayButton(),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText.normalText(
                                      "Focus Attention",
                                      fontSize: 16,
                                      isBold: true,
                                    ),
                                    AppText.normalText(
                                      "10 Mins",
                                      fontSize: 11,
                                      color: const Color(0xffA1A4B2),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                          ),
                          EpisodeWidget(
                            title: "Body Scan",
                            duration: "5 MIN",
                            op: () {},
                          ),
                          Divider(
                            height: 1,
                          ),
                          EpisodeWidget(
                            title: "Making Happiness",
                            duration: "3 MIN",
                            op: () {},
                          ),
                        ],
                      ),
                      tabTwo: Column(
                        children: [
                          EpisodeWidget(
                            title: "Focus Attention",
                            duration: "10 MIN",
                            isSelected: false,
                            op: () {},
                          ),
                          Divider(
                            height: 1,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: stop,
                                  child: Icon(
                                    second.isPlaying.value
                                        ? Icons.pause
                                        : Icons.play_circle_fill,
                                    size: 40,
                                    color: Color(0xff8E97FD),
                                  ),
                                ),
                                // getPlayButton(),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText.normalText(
                                      "Body Scan",
                                      fontSize: 16,
                                      isBold: true,
                                    ),
                                    AppText.normalText(
                                      "5 Mins",
                                      fontSize: 11,
                                      color: const Color(0xffA1A4B2),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                          ),
                          EpisodeWidget(
                            title: "Making Happiness",
                            duration: "3 MIN",
                            op: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
