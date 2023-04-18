import 'package:flutter/material.dart';
import 'package:meditation_app/src/screens/chatbot/chatbot.dart';
import 'package:meditation_app/src/screens/meditation_screen/meditatation_screen.dart';
import 'package:meditation_app/src/screens/sleep_screens/sleep_home_screen.dart';

import '../chatbot/chat.dart';
import '../chatbot/chat_final.dart';
import '../chatbot/chat_ui.dart';
import '../home_screen/home_screen.dart';
import '../mood_tracker/mood_tracker_screen.dart';
import '../profile_screen/profile_screen.dart';

class NavigationTabData {
  final IconData iconData;
  final String label;
  final Widget page;

  NavigationTabData(this.iconData, this.label, this.page);
}

var navigationTabsData = [
  NavigationTabData(Icons.home, "HOME", const HomeScreen()),
  NavigationTabData(Icons.bed, "SLEEP", const SleepHomeScreen()),
  NavigationTabData(Icons.chair, "MEDITATE", const MeditateScreen()),
  NavigationTabData(Icons.music_note, "MOOD", const MoodTrackerScreen()),
  NavigationTabData(Icons.person, "PROFILE", ProfilePage()),
];
