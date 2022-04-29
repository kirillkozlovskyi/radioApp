import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radio/constants.dart';
import 'package:radio/models/song.model.dart';

class SongItem extends StatefulWidget {
  const SongItem({Key? key, required this.songItem, this.songPress, this.onSongNamePress})
      : super(key: key);
  final SongModel songItem;
  final songPress;
  final onSongNamePress;
  @override
  State<SongItem> createState() => _SongItemState();
}

class _SongItemState extends State<SongItem> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    String imgUri =  ApiConstants.codeveryWork + '/images' + widget.songItem.imageUrl;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () { setState(() {
                  widget.onSongNamePress(true);
                }); },
                child: Row(
                  children: [
                    Container(
                      height: 64.0,
                      width: 64.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: widget.songItem.imageUrl.contains('.svg')
                              ? const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/Purplecom.jpg'))
                              : DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(imgUri))
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - (128 + 24),
                      padding: const EdgeInsets.only(left: 23.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.songItem.title,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Color(0xFF1A1C4E),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700)),
                          Text(widget.songItem.artist,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Color(0xFF7F82A1),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                child: Icon(widget.songItem.isPlay ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    widget.songPress(widget.songItem);
                  });
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 0, color: Colors.transparent),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  primary: Colors.transparent,
                  onPrimary: ColorConstants.primaryColor,
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Color(0xFFF0F0F0), height: 1.0),
      ],
    );
  }
}
