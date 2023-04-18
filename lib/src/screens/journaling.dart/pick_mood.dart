import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meditation_app/src/screens/journaling.dart/journaling_screen.dart';

import '../../common_widgets/app_text.dart';
import '../../themes/theme.dart';

class MoodPicker extends StatefulWidget {
  const MoodPicker({Key? key}) : super(key: key);

  @override
  State<MoodPicker> createState() => _MoodPickerState();
}

class _MoodPickerState extends State<MoodPicker> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close)),
                  Spacer(),
                  AppText.normalText(
                    "Pick Mood",
                    isBold: true,
                    fontSize: 20,
                    color: AppTheme.of(context).theme.headerTextColor,
                  ),
                  Spacer()
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2, // number of columns
                  crossAxisSpacing: 10.0, // space between columns
                  mainAxisSpacing: 10.0, // space between rows
                  children: <Widget>[
                    // list of widgets to display in the grid
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JournalingScreen()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.grey.withOpacity(0.3))
                            ]),
                        height: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/calm.png",
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppText.normalText(
                              "Calm",
                              isBold: true,
                              fontSize: 20,
                              color: AppTheme.of(context).theme.headerTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.grey.withOpacity(0.3))
                            ]),
                        height: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/excited.png",
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppText.normalText(
                              "Excited",
                              isBold: true,
                              fontSize: 20,
                              color: AppTheme.of(context).theme.headerTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.grey.withOpacity(0.3))
                            ]),
                        height: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/happy.png",
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppText.normalText(
                              "Happy",
                              isBold: true,
                              fontSize: 20,
                              color: AppTheme.of(context).theme.headerTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.grey.withOpacity(0.3))
                            ]),
                        height: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/irritated.png",
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppText.normalText(
                              "Irritated",
                              isBold: true,
                              fontSize: 20,
                              color: AppTheme.of(context).theme.headerTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.grey.withOpacity(0.3))
                            ]),
                        height: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/worried.png",
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppText.normalText(
                              "Anxious",
                              isBold: true,
                              fontSize: 20,
                              color: AppTheme.of(context).theme.headerTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.grey.withOpacity(0.3))
                            ]),
                        height: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/bored.png",
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppText.normalText(
                              "Bored",
                              isBold: true,
                              fontSize: 20,
                              color: AppTheme.of(context).theme.headerTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.grey.withOpacity(0.3))
                            ]),
                        height: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/tired.png",
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppText.normalText(
                              "Tired",
                              isBold: true,
                              fontSize: 20,
                              color: AppTheme.of(context).theme.headerTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.grey.withOpacity(0.3))
                            ]),
                        height: 150.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/sad.png",
                              height: 50,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppText.normalText(
                              "Sad",
                              isBold: true,
                              fontSize: 20,
                              color: AppTheme.of(context).theme.headerTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
