import 'dart:convert';
List<SongModel> songModelFromJson(String str) =>
    List<SongModel>.from(json.decode(str).map((x) => SongModel.fromJson(x)));

class SongModel {
  String id;
  String url;
  String artist;
  String title;
  String album;
  String genre;
  String year;
  String streamId;
  String imageUrl;

  SongModel({
    required this.id,
    required this.url,
    required this.artist,
    required this.title,
    required this.album,
    required this.genre,
    required this.year,
    required this.streamId,
    required this.imageUrl,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
        id: json['id'],
        url: json['url'],
        artist: json['artist'],
        title: json['title'],
        album: json['album'],
        genre: json['genre'],
        year: json['year'],
        streamId: json['stream_id'],
        imageUrl: json['image_url']
    );
  }


}

