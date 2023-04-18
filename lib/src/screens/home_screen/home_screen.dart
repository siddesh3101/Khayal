import 'package:any_link_preview/any_link_preview.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation_app/src/common_widgets/app_text.dart';
import 'package:meditation_app/src/common_widgets/play_music_card.dart';
import 'package:meditation_app/src/screens/home_screen/book_session.dart';
import 'package:meditation_app/src/screens/home_screen/recommended_card_widget.dart';
import 'package:meditation_app/src/screens/home_screen/recommended_music_dummy_data.dart';
import 'package:meditation_app/src/services/toplist_service.dart';
import 'package:meditation_app/src/themes/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../chatbot/chat_final.dart';
import 'home_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Uri _url = Uri.parse('https://flutter.dev');
  // AudioPlayer audioPlayer = AudioPlayer();
  final assetsAudioPlayer = AssetsAudioPlayer();
  Future<void>? _launched;
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // playBackgroundMusic();
    assetsAudioPlayer.open(
      Audio("assets/meditation/nature.mp3"),
    );
    // assetsAudioPlayer.play();

    super.initState();
  }

  // Future<void> playBackgroundMusic() async {
  //   await audioPlayer.play('meditation/amitabh.mp3', isLocal: true);
  // }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.of(context).theme.scaffoldBackgroundColor,
        body: Stack(
          children: [
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   child: SizedBox(
            //     // height: MediaQuery.of(context).size.height,
            //     child: Lottie.network(
            //       'https://assets5.lottiefiles.com/packages/lf20_f1rpywm1.json',
            //       fit: BoxFit.fitHeight,
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
                          width: 110,
                          // semanticsLabel: 'A red up arrow',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: stopBackgroundMusic,
                          child: Icon(assetsAudioPlayer.isPlaying.value
                              ? Icons.pause
                              : Icons.play_arrow))
                    ],
                  ),
                  const SizedBox(height: 40),
                  AppText.normalText(
                    "Good Afternoon",
                    fontSize: 28,
                    isBold: true,
                    color: AppTheme.of(context).theme.headerTextColor,
                  ),
                  AppText.normalText(
                    "We wish you have a good day",
                    fontSize: 20,
                    color: AppTheme.of(context).theme.bodyTextColor,
                  ),
                  const SizedBox(height: 20),
                  AppText.normalText(
                    "How are you feeling today?",
                    fontSize: 28,
                    isBold: true,
                    color: AppTheme.of(context).theme.headerTextColor,
                  ),
                  Image.asset(
                    "assets/images/new_mood.png",
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                  ),

                  const SizedBox(height: 20),

                  // const SizedBox(height: 20),

                  // const PlayMusicCard(
                  //   imageBackground:
                  //       "assets/images/home_cards/play_music_card.png",
                  //   title: "Daily Thoughts",
                  //   subText: "Meditation 3-10 MIN",
                  //   color: Colors.white,
                  // ),
                  // const SizedBox(height: 20),
                  AppText.normalText(
                    "Your 4 AM friend",
                    fontSize: 28,
                    isBold: true,
                    color: AppTheme.of(context).theme.headerTextColor,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              offset: Offset(0, 1),
                              color: Colors.grey.withOpacity(0.354))
                        ]),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, top: 10, bottom: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   width: double.maxFinite,
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(10.0),
                          //     child: SvgPicture.asset(
                          //       recommendedMusicData.image,
                          //       height: 115,
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(height: 10),
                          Lottie.network(
                              'https://assets9.lottiefiles.com/packages/lf20_iombyzfq.json'),
                          AppText.normalText(
                            "How are you feeling now?",
                            fontSize: 18,
                            isBold: true,
                          ),
                          const SizedBox(height: 5),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            ),
                            child: Text("Talk Now"),
                          ),
                          // AppText.normalText(
                          //   "Hi",
                          //   fontSize: 12,
                          //   color: const Color(0xffA1A4B2),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      HomeCardWidget(
                        backgroundImage:
                            'assets/images/home_cards/card_one.png',
                        title: "Basics",
                        subTitle: "Course",
                        mainTextColor: Color(0xffFFECCC),
                        textColor: Color(0xffebeaec),
                        buttonColor: Color(0xff3F414E),
                      ),
                      Spacer(),
                      HomeCardWidget(
                        backgroundImage:
                            'assets/images/home_cards/card_two.png',
                        title: "Relaxation",
                        subTitle: "Music",
                        mainTextColor: Color(0xff3F414E),
                        textColor: Color(0xff3F414E),
                        buttonColor: Color(0xffFEFFFE),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BookSession()),
                      );
                    },
                    child: Image.asset(
                      "assets/images/session.png",
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                    ),
                  ),
                  AppText.normalText(
                    "Recommended for you",
                    fontSize: 28,
                    isBold: true,
                    color: AppTheme.of(context).theme.headerTextColor,
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: recommendedMusicDummyData.map((e) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: RecommendedMusicCardWidget(
                            recommendedMusicData: e,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  // const SizedBox(height: 15),
                  Image.asset(
                    "assets/images/quote.png",
                    width: MediaQuery.of(context).size.width,
                    height: 110,
                  ),

                  AppText.normalText(
                    "Top Helps Online",
                    fontSize: 28,
                    isBold: true,
                    color: AppTheme.of(context).theme.headerTextColor,
                  ),
                  const SizedBox(height: 15),

                  FutureBuilder<List<dynamic>>(
                    future: TopListService().getTopList(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const CircularProgressIndicator();
                        default:
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return SizedBox(
                              height: 120,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, bottom: 10),
                                    child: SizedBox(
                                      height: 80,
                                      width: 300,
                                      child: AnyLinkPreview(
                                        link: snapshot.data![index]["url"],
                                        displayDirection:
                                            UIDirection.uiDirectionHorizontal,
                                        showMultimedia: true,

                                        bodyMaxLines: 5,
                                        bodyTextOverflow: TextOverflow.ellipsis,
                                        titleStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                        bodyStyle: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                        errorBody: 'Show my custom error body',
                                        errorTitle:
                                            'Show my custom error title',
                                        errorWidget: Container(
                                          color: Colors.grey[300],
                                          child: Text('Oops!'),
                                        ),
                                        errorImage: "https://google.com/",
                                        cache: Duration(days: 7),
                                        backgroundColor: Colors.white,
                                        borderRadius: 12,
                                        removeElevation: false,
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 2,
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              offset: Offset(0, 2))
                                        ],
                                        onTap: () async {
                                          // const url =
                                          //     'https://blog.logrocket.com';
                                          if (await canLaunch(
                                            snapshot.data![index]["url"],
                                          )) {
                                            await launch(
                                              snapshot.data![index]["url"],
                                            );
                                          } else {
                                            throw 'Could not launch ${snapshot.data![index]["url"]}';
                                          }
                                        },
                                        // child: const CustomWidget(
                                        //   icon: Icons.language,
                                        //   label: 'Open a URL',
                                        // ),                                     }, // This disables tap event
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                      }
                    },
                  ),

                  const SizedBox(height: 15),
                  AppText.normalText(
                    "Buy Subscription",
                    fontSize: 28,
                    isBold: true,
                    color: AppTheme.of(context).theme.headerTextColor,
                  ),
                  AppText.normalText(
                    "Enjoy seamless therapies from top therapists",
                    fontSize: 14,
                    textAlign: TextAlign.left,
                    color: AppTheme.of(context).theme.bodyTextColor,
                  ),
                  // const SizedBox(height: 15),
                  Image.asset(
                    "assets/images/membership.png",
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                  ),
                ],
              ),
            ),
            // Lottie.network(
            //     'https://assets4.lottiefiles.com/private_files/lf30_Ba6XfL.json'),
          ],
        ));
  }
}
