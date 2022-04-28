import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:radio/api_service.dart';

import '../constants.dart';
import '../models/song.model.dart';
import '../models/stream.model.dart';
import '../widgets/app_bar.dart';
import '../widgets/songListItem.dart';

class SingleStream extends StatefulWidget {
  const SingleStream({Key? key, required this.streamModel}) : super(key: key);
  final StreamModel streamModel;
  @override
  State<SingleStream> createState() => _SingleStreamState();
}

class _SingleStreamState extends State<SingleStream> {
  void initState() {
    super.initState();
    _getSongs();
  }

  List<SongModel> _songModel = [];
  void _getSongs() async {
    _songModel =
        (await ApiService().getSongsByStreamId(widget.streamModel.streamId))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(title: widget.streamModel.streamName),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
          child: _songModel.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                      color: ColorConstants.primaryColor))
              : ListView.builder(
                  itemCount: _songModel.length,
                  itemBuilder: (context, index) =>
                    SongItem(songItem: _songModel[index]),
                )),
    );
  }
}
