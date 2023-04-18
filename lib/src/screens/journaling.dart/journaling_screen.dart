import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/src/common_widgets/app_text.dart';
import 'package:meditation_app/src/common_widgets/play_music_card.dart';
import 'package:meditation_app/src/screens/home_screen/recommended_card_widget.dart';
import 'package:meditation_app/src/screens/home_screen/recommended_music_dummy_data.dart';
import 'package:meditation_app/src/services/quote_service.dart';
import 'package:meditation_app/src/themes/theme.dart';
import 'package:rive/rive.dart';

import '../../common_widgets/checkin_widgets.dart';
import '../../widgets/prompt.dart';
import '../home_screen/home_card_widget.dart';
import '../music_player_screen/light_music_player_screen.dart';

class JournalingScreen extends StatefulWidget {
  const JournalingScreen({Key? key}) : super(key: key);

  @override
  State<JournalingScreen> createState() => _JournalingScreenState();
}

class _JournalingScreenState extends State<JournalingScreen> {
  late List<TextEditingController> controllers;
  List<Map<String, dynamic>> datareceived = [];
  // late RiveAnimationController _controller;

  // // Toggles between play and pause animation states
  // void _togglePlay() =>
  //     setState(() => _controller.isActive = !_controller.isActive);

  // /// Tracks if the animation is playing by whether controller is running
  // bool get isPlaying => _controller.isActive;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = SimpleAnimation('idle');
  // }
  final List<Map<String, dynamic>> journaling = [
    {
      "question":
          "What is something you're looking forward to in the near future?",
      "activity": "no"
    },
    {
      "question":
          "What is something you've accomplished recently that you're proud of?",
      "activity": "no"
    },
    {
      "question":
          "Choose a task or activity that you want to work on, such as cleaning your room or studying for a test. Set a timer for 25 minutes and work on the task for that entire time, without any distractions. When the timer goes off, take a short break for 5 minutes. Repeat this cycle three more times, and then take a longer break of 20-30 minutes. This technique is called the Pomodoro technique and can help increase productivity and focus.",
      "activity": "yes"
    },
    // {
    //   "question": "I always find this technique..",
    // },
    // {
    //   "question": "Cry",
    // },
    // {
    //   "question": "",
    // }
  ];

  @override
  void initState() {
    // TODO: implement initState

    controllers = List.generate(
        journaling.length, (index) => TextEditingController(text: ""));
    // data();

    super.initState();
  }

  // void data() async {
  //   List<Map<String, dynamic>> message = await GetQuotesService().getQuotes();
  //   setState(() {
  //     datareceived = message;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          body: Container(
            height: double.infinity,
            child: Stack(children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.close)),
                        Spacer(),
                        Center(
                          child: Image.asset(
                            "assets/images/app_logo.png",
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                    const SizedBox(height: 40),
                    // AppText.normalText(
                    //   "Good Afternoon",
                    //   fontSize: 28,
                    //   isBold: true,
                    //   color: AppTheme.of(context).theme.headerTextColor,
                    // ),
                    // AppText.normalText(
                    //   "We wish you have a good day",
                    //   fontSize: 20,
                    //   color: AppTheme.of(context).theme.bodyTextColor,
                    // ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 184, 208, 251),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  offset: Offset(0, 2),
                                  color: Colors.grey.withOpacity(0.2))
                            ]
                            // image: DecorationImage(
                            //   // image: AssetImage(imageBackground),
                            //   fit: BoxFit.cover,
                            // ),
                            ),
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 15,
                        //   vertical: 15,
                        // ),
                        child: Container(
                          // padding: const EdgeInsets.symmetric(
                          //   horizontal: 30,
                          // ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, top: 15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "“You can get everything in life you want if you will\n just help enough other people get what\n they want.” — Zig Ziglar",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Text(
                                    //       "Bye",
                                    //       style: TextStyle(
                                    //         fontWeight: FontWeight.normal,
                                    //         fontSize: 12,
                                    //         color: Colors.white,
                                    //       ),
                                    //       textAlign: TextAlign.center,
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                                // const Spacer(),
                                // Icon(
                                //   Icons.play_circle_fill,
                                //   color: color,
                                //   size: 40,
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: QuestionScreen(
                        questions: journaling,
                        editingController: controllers,
                      ),
                    ),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   itemBuilder: (context, index) {
                    //     return JournalWidget(
                    //       textEdiot: controllers[index],
                    //     );
                    //   },
                    //   itemCount: 3,
                    // ),

                    // DailyCheckIn(
                    //   // imageBackground: "assets/images/home_cards/play_music_card.png",
                    //   title: "Morning jump-start",
                    //   subText: "Get the most of the day",
                    //   color: Colors.black,
                    //   color2: Color.fromARGB(255, 255, 242, 197),
                    //   op: () {
                    //     print("pressed");
                    //     //   void onClicked(BuildContext context) {
                    //     // Navigator.push(
                    //     //   context,
                    //     //   MaterialPageRoute(
                    //     //       builder: (context) => const LightMusicPlayer()),
                    //     // );
                    //     //   }
                    //     // }
                    //   },
                    // ),
                    // const SizedBox(height: 30),
                    // Row(
                    //   children: const [
                    //     HomeCardWidget(
                    //       backgroundImage: 'assets/images/home_cards/card_one.png',
                    //       title: "Basics",
                    //       subTitle: "Course",
                    //       mainTextColor: Color(0xffFFECCC),
                    //       textColor: Color(0xffebeaec),
                    //       buttonColor: Color(0xff3F414E),
                    //     ),
                    //     Spacer(),
                    //     HomeCardWidget(
                    //       backgroundImage: 'assets/images/home_cards/card_two.png',
                    //       title: "Relaxation",
                    //       subTitle: "Music",
                    //       mainTextColor: Color(0xff3F414E),
                    //       textColor: Color(0xff3F414E),
                    //       buttonColor: Color(0xffFEFFFE),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 20),
                    // const PlayMusicCard(
                    //   imageBackground: "assets/images/home_cards/play_music_card.png",
                    //   title: "Daily Thoughts",
                    //   subText: "Meditation 3-10 MIN",
                    //   color: Colors.white,
                    // ),
                    // const SizedBox(height: 40),
                    // const SizedBox(height: 20),
                    // checkin
                    // DailyCheckIn(
                    //   // imageBackground: "assets/images/home_cards/play_music_card.png",
                    //   title: "Morning jump-start",
                    //   subText: "Get the most of the day",
                    //   color: Colors.black,
                    //   color2: Color.fromARGB(255, 255, 226, 138),
                    //   op: () {
                    //     print("pressed");
                    //     //   void onClicked(BuildContext context) {
                    //     // Navigator.push(
                    //     //   context,
                    //     //   MaterialPageRoute(
                    //     //       builder: (context) => const LightMusicPlayer()),
                    //     // );
                    //     //   }
                    //     // }
                    //   },
                    // ),
                    // const SizedBox(height: 10),
                    // // checkin
                    // DailyCheckIn(
                    //   // imageBackground: "assets/images/home_cards/play_music_card.png",
                    //   title: "Afternoon check-in",
                    //   subText: "Stopping for a moment to check-in",
                    //   color: Colors.black,
                    //   color2: Color.fromARGB(255, 190, 185, 251), op: () {},
                    // ),
                    // const SizedBox(height: 10),
                    // // checkin
                    // DailyCheckIn(
                    //   // imageBackground: "assets/images/home_cards/play_music_card.png",
                    //   title: "Evening rewind",
                    //   subText: "Let's reflect on your day",
                    //   color: Colors.black,
                    //   color2: Color.fromARGB(255, 251, 212, 185), op: () {},
                    // ),
                    // InkWell(
                    //   onTap: _togglePlay,
                    //   child: SizedBox(
                    //     width: 100,
                    //     height: 100,
                    //     child: RiveAnimation.asset(
                    //       'assets/rive/talking_animation.riv',
                    //       controllers: [_controller],
                    //       // Update the play state when the widget's initialized
                    //       onInit: (_) => setState(() {}),
                    //     ),
                    //   ),
                    // ),
                    // AppText.normalText(
                    //   "Recommended for you",
                    //   fontSize: 28,
                    //   isBold: true,
                    //   color: AppTheme.of(context).theme.headerTextColor,
                    // ),
                    // const SizedBox(height: 20),
                    // SingleChildScrollView(
                    //   physics: const BouncingScrollPhysics(),
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: recommendedMusicDummyData.map((e) {
                    //       return Container(
                    //         margin: const EdgeInsets.symmetric(horizontal: 10),
                    //         child: RecommendedMusicCardWidget(
                    //           recommendedMusicData: e,
                    //         ),
                    //       );
                    //     }).toList(),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}

class JournalWidget extends StatelessWidget {
  const JournalWidget({
    Key? key,
    required this.textEdiot,
  }) : super(key: key);

  final TextEditingController textEdiot;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.normalText(
          "How have you been able to manage your work stress in the past? What are some techniques that have helped you feel more at ease and productive? ",
          fontSize: 18,
          isBold: true,
          textAlign: TextAlign.left,
          color: AppTheme.of(context).theme.headerTextColor,
        ),
        SizedBox(
          height: 5,
        ),
        AppText.normalText(
          "I always find this technique..",
          fontSize: 20,
          color: AppTheme.of(context).theme.bodyTextColor,
        ),
      ],
    );
  }
}
