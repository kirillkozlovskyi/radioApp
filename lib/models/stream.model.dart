class StreamModel {
  String streamId;
  String streamName;
  String streamUrl;
  String streamColor;
  String streamBackground;
  String streamSlideshow = '';
  StreamModel({
    required this.streamId,
    required this.streamName,
    required this.streamUrl,
    required this.streamColor,
    required this.streamBackground,
    required this.streamSlideshow,
  });

  factory StreamModel.fromJson(Map<String, dynamic> json) => StreamModel(
      streamId: json['stream_id'],
      streamName: json['stream_name'],
      streamUrl: json['stream_url'],
      streamColor: json['stream_color'],
      streamBackground: json['stream_background'],
      streamSlideshow: json['stream_slideshow'],
  );
}