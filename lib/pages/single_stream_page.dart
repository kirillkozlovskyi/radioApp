import 'package:flutter/material.dart';

import '../models/stream.model.dart';
import '../widgets/app_bar.dart';

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
      appBar: StyledAppBar(title: widget.streamModel.streamName),
      body: Container(
        child: Text('Stream page container'),
      ),
    );
  }
}
