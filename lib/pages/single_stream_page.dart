import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:radio/api_service.dart';

import '../constants.dart';
import '../models/song.model.dart';
import '../models/stream.model.dart';
import '../widgets/app_bar.dart';
import '../widgets/modal_bottom_sheet.dart';
import '../widgets/songListItem.dart';

class SingleStream extends StatefulWidget {
  const SingleStream({Key? key, required this.streamModel, this.onShowSongWindow, this.selectedSong}) : super(key: key);
  final StreamModel streamModel;
  final onShowSongWindow;
  final selectedSong;
  @override
  State<SingleStream> createState() => _SingleStreamState();
}

class _SingleStreamState extends State<SingleStream> {
  @override
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
                SongItem(
                  songItem: _songModel[index],
                  songPress: (SongModel songItem) { resetPlayBnt(index); },
                  onSongNamePress: (bool data) {
                    // TODO open modal bottom Sheet
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const BuildBottomSheet());
                    print('SongItem');
                    setState(() {
                      widget.onShowSongWindow(data);
                    });

                  },
                ),
          )),
    );
  }
  resetPlayBnt(index) {
    setState(() {
      for(var i in _songModel) {
        if (i.id == _songModel[index].id) {
          _songModel[index].isPlay = !_songModel[index].isPlay;
          widget.selectedSong(_songModel[index]);
        } else {
          i.isPlay = false;
        }
      }
    });
  }

}
