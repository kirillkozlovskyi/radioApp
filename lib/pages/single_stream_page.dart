import 'package:flutter/material.dart';

import '../models/stream.model.dart';

class SingleStream extends StatefulWidget {
  const SingleStream({Key? key, required this.streamModel}) : super(key: key);
  final StreamModel streamModel;
  @override
  State<SingleStream> createState() => _SingleStreamState();
}

class _SingleStreamState extends State<SingleStream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.streamModel.streamName),
      ),
      body: Container(
        child: Text('Stream page container'),
      ),
    );
  }
}
