import 'package:flutter/material.dart';
import 'package:meditation_app/src/screens/music_player_screen/sleep_music_player.dart';

class DailyCheckIn extends StatelessWidget {
  // final String imageBackground;
  final String title;
  final String subText;
  final Color color;
  final Color? color2;
  final VoidCallback op;

  const DailyCheckIn({
    Key? key,
    // required this.imageBackground,
    required this.title,
    required this.subText,
    required this.color,
    this.color2,
    required this.op,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: op,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: color2,
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
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: color,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        subText,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: color.withOpacity(0.5),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
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
    );
  }

  // void onClicked(BuildContext context) {
  //
  // }
}
