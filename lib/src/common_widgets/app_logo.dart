import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/app_logo.png",
      width: 100,
      // semanticsLabel: 'A red up arrow',
      fit: BoxFit.cover,
    );
  }
}

class AppLogoLight extends StatelessWidget {
  const AppLogoLight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/app_logo.png",
      color: Colors.white,
      width: 100,
      // semanticsLabel: 'A red up arrow',
      fit: BoxFit.cover,
    );
  }
}
