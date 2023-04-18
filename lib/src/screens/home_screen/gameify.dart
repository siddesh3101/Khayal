// import 'dart:async';
// import 'dart:math';

// import 'package:flutter/material.dart';

// class GameScreen extends StatefulWidget {
//   @override
//   _GameScreenState createState() => _GameScreenState();
// }

// class _GameScreenState extends State<GameScreen> {
//   Random random = Random();
//   List<String> texts = [
//     "Click me!",
//     "Don't let me escape!",
//     "Pick me!",
//     "Choose me!",
//     "Tap me!",
//     "I'm the one!",
//     "Here I am!",
//     "Me, me, me!",
//     "Over here!",
//     "Right here!"
//   ];
//   String? currentText;
//   int score = 0;
//   bool gameStarted = false;
//   double positionX = 0.0;
//   double positionY = 0.0;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (currentText == null) {
//       positionX =
//           random.nextDouble() * (MediaQuery.of(context).size.width - 100);
//       positionY =
//           random.nextDouble() * (MediaQuery.of(context).size.height - 100);
//       updateText();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Positioned(
//             left: positionX,
//             top: positionY,
//             child: GestureDetector(
//               onTap: () {
//                 if (gameStarted) {
//                   if (currentText != null) {
//                     setState(() {
//                       score++;
//                       currentText = null;
//                       positionX = random.nextDouble() *
//                           (MediaQuery.of(context).size.width - 100);
//                       positionY = random.nextDouble() *
//                           (MediaQuery.of(context).size.height - 200);
//                     });
//                   }
//                 } else {
//                   startGame();
//                 }
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.black,
//                     width: 2.0,
//                   ),
//                 ),
//                 padding: EdgeInsets.all(16.0),
//                 child: Text(
//                   currentText ?? "Tap to start",
//                   style: TextStyle(
//                     fontSize: 24.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void startGame() {
//     setState(() {
//       currentText = null;
//       score = 0;
//       gameStarted = true;
//     });

//     Timer(Duration(seconds: 10), endGame);
//   }

//   void updateText() {
//     setState(() {
//       currentText = texts[random.nextInt(texts.length)];
//       positionX =
//           random.nextDouble() * (MediaQuery.of(context).size.width - 100);
//       positionY =
//           random.nextDouble() * (MediaQuery.of(context).size.height - 100);
//     });

//     Timer(Duration(seconds: 3), () {
//       if (gameStarted) {
//         updateText();
//       }
//     });
//   }

//   void endGame() {
//     setState(() {
//       gameStarted = false;
//     });
//   }
// }
