import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool isPaused = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          child: Icon(isPaused ? Icons.play_arrow : Icons.pause),
          onPressed: () {
            setState(() {
              isPaused = !isPaused;
            });
          },
          style: ElevatedButton.styleFrom(
            side: const BorderSide(
                width: 3, color: Color(0xFF3A63B6)), //border width and color
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            primary: ColorConstants.primaryColor,
            onPrimary: Colors.white,
          ),
        ),
      ],
    );
  }
}
