import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/src/common_widgets/app_text.dart';
import 'package:meditation_app/src/common_widgets/play_music_card.dart';
import 'package:meditation_app/src/screens/home_screen/recommended_card_widget.dart';
import 'package:meditation_app/src/screens/home_screen/recommended_music_dummy_data.dart';
import 'package:meditation_app/src/themes/theme.dart';
import 'package:rive/rive.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../../common_widgets/checkin_widgets.dart';
import '../home_screen/home_card_widget.dart';
import '../home_screen/recommended_journals.dart';
import '../journaling.dart/journaling_screen.dart';
import '../journaling.dart/pick_mood.dart';
import '../music_player_screen/light_music_player_screen.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({Key? key}) : super(key: key);

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  bool isPlaying = false;
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
  @override
  void initState() {
    // TODO: implement initState
    // _playAudio();
    super.initState();
  }

  Future<void> _playAudio() async {
    var yt = YoutubeExplode();
    var id = "aboZctrHfK8";
    var file = File("assets/mySong.mp4");
    var start = "2000ms";
    var end = "5000ms";

// Downloading audio only
    var manifest = await yt.videos.streamsClient.getManifest(id);
    var audio = manifest.audioOnly.first;
    var audioStream = yt.videos.streamsClient.get(audio);
    var output = file.openWrite(mode: FileMode.writeOnlyAppend);
    audioStream.forEach((element) {
      output.add(element);
    });
    // for (final data in audioStream) {
    //   output.add(data);
    // }

// Croping audio
    FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
    await _flutterFFmpeg.executeWithArguments([
      "-v",
      "error",
      "-ss",
      start,
      "-to",
      end,
      "-i",
      file.path,
      "-acodec",
      "copy",
      "myCroppedSong.mp4"
    ]);
//     if (streamInfo != null) {
//     var stream = yt.videos.streamsClient.get(streamInfo);
//     File _fileName = file.path; // this is path of Directory instance
//     var fileStream = file.openWrite();

//       // Pipe all the content of the stream into the file.
//       try {
//         await stream.pipe(fileStream).then((value) {
//           return value;
//         }).catchError((err) => error = err);
//       } catch(err){
//         error = err.toString();
//       }

//       // Close the file.
//       await fileStream.flush();
//       await fileStream.close();
// }
  }

  // Future<void> _pauseAudio() async {
  //   await audioPlayer.pause();
  //   setState(() {
  //     isPlaying = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/app_logo.png",
                fit: BoxFit.cover,
                width: 100,
              ),
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
            DailyCheckIn(
              // imageBackground: "assets/images/home_cards/play_music_card.png",
              title: "Morning jump-start",
              subText: "Get the most of the day",
              color: Colors.black,
              color2: Color.fromARGB(255, 255, 226, 138),
              op: () {
//   void onClicked(BuildContext context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MoodPicker()),
                );
//   }
// }
              },
            ),
            const SizedBox(height: 10),
            // checkin
            DailyCheckIn(
              // imageBackground: "assets/images/home_cards/play_music_card.png",
              title: "Afternoon check-in",
              subText: "Stopping for a moment to check-in",
              color: Colors.black,
              color2: Color.fromARGB(255, 190, 185, 251),
              op: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MoodPicker()),
                );
              },
            ),
            const SizedBox(height: 10),
            // checkin
            DailyCheckIn(
              // imageBackground: "assets/images/home_cards/play_music_card.png",
              title: "Evening rewind",
              subText: "Let's reflect on your day",
              color: Colors.black,
              color2: Color.fromARGB(255, 251, 212, 185),
              op: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MoodPicker()),
                );
              },
            ),
            const SizedBox(height: 40),
            AppText.normalText(
              "Reflect On Your Journals",
              fontSize: 28,
              isBold: true,
              color: AppTheme.of(context).theme.headerTextColor,
            ),
            AppText.normalText(
              "Small Entries Big Impact",
              fontSize: 20,
              color: AppTheme.of(context).theme.bodyTextColor,
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: recommendedJournals.map((e) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: RecommendedMusicCardWidget(
                      recommendedMusicData: e,
                    ),
                  );
                }).toList(),
              ),
            ),
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
    );
  }
}
