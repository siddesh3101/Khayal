import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import '../constants/constant.dart';
import '../services/assets_manager.dart';
import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {required this.msg, required this.chatIndex, this.shouldAnimate = false});

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: chatIndex == 0 ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft:
                    chatIndex == 0 ? Radius.circular(10) : Radius.circular(0),
                topRight: Radius.circular(10),
                bottomRight:
                    chatIndex == 0 ? Radius.circular(0) : Radius.circular(10)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.asset(
                    //   chatIndex == 0
                    //       ? AssetsManager.userImage
                    //       : AssetsManager.botImage,
                    //   height: 30,
                    //   width: 30,
                    // ),
                    // const SizedBox(
                    //   width: 8,
                    // ),
                    Expanded(
                      child: chatIndex == 0
                          ? TextWidget(
                              label: msg,
                            )
                          : shouldAnimate
                              ? DefaultTextStyle(
                                  style: const TextStyle(
                                      color: Color(0xFF52595D),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                  child: AnimatedTextKit(
                                      isRepeatingAnimation: false,
                                      repeatForever: false,
                                      displayFullTextOnTap: true,
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                        TyperAnimatedText(
                                          msg.trim(),
                                        ),
                                      ]),
                                )
                              : Text(
                                  msg.trim(),
                                  style: const TextStyle(
                                      color: Color(0xFF52595D),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                    ),
                    // chatIndex == 0
                    //     ? const SizedBox.shrink()
                    //     : Row(
                    //         mainAxisAlignment: MainAxisAlignment.end,
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: const [
                    //           Icon(
                    //             Icons.thumb_up_alt_outlined,
                    //             color: Colors.white,
                    //           ),
                    //           SizedBox(
                    //             width: 5,
                    //           ),
                    //           Icon(
                    //             Icons.thumb_down_alt_outlined,
                    //             color: Colors.white,
                    //           )
                    //         ],
                    //       ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
