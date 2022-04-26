import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:radio/constants.dart';
import 'package:radio/models/stream.model.dart';

class ApiService {
  Future <List<StreamModel>?> getStreams() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.streamsList + ApiConstants.requestFormat);
      var response = await http.get(url);
      // if (response.)

    } catch(e) {
      log(e.toString());
    }
  }
}