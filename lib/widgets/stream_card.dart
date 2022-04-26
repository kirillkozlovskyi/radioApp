import 'package:flutter/material.dart';
import 'package:radio/models/stream.model.dart';

import '../constants.dart';

class StreamCard extends StatelessWidget {
  const StreamCard({Key? key, required this.streamModel}) : super(key: key);
  final StreamModel streamModel;
  @override
  Widget build(BuildContext context) {
    var imgUri = ApiConstants.codeveryWork + '/' + streamModel.streamBackground;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: const Color(0xFF0C0D31),
      child: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(imgUri), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: ColorConstants.primaryColor,
                fixedSize:
                    Size(MediaQuery.of(context).size.width * 0.37, 47.0)),
            label: Text(
              streamModel.streamName.toString().toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
            icon: const Icon(Icons.play_arrow),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
