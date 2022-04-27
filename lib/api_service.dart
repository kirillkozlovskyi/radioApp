import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:radio/constants.dart';

import 'models/song.model.dart';
import 'models/stream.model.dart';


class ApiService {
  Future <List<StreamModel>?> getStreams() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.streamsList + ApiConstants.requestFormat);
      var response = await http.get(url);
      if (response.statusCode == 200) {
       List<StreamModel> _model = userModelFromJson(response.body);
       return _model;
      }
    } catch(e) {
      log(e.toString());
    }
  }
  
  Future <List<SongModel>?> getSongsByStreamId(String streamId) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.songsListByStreamId + streamId + ApiConstants.requestFormat);
      var response = await http.get(url);
      if(response.statusCode == 200) {
        List<SongModel> _model = songModelFromJson(response.body);
        return _model;
      }
    } catch(e) {
      log(e.toString());
    }
  }
}