import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rfk/models/homeModel.dart';
import 'package:http/http.dart' as http;

class HomeService extends ChangeNotifier {
  final String _baseUrl = dotenv.get('API_URL');
  final List<ImageHome> images = [];
  Future<List<ImageHome>> loadImages() async {
    final url = Uri.https(_baseUrl, 'home.json');
    try {
      final resp = await http.get(url);
      final Map<String, dynamic> dataResp = json.decode(resp.body);
      dataResp.forEach((key, value) {
        final image = ImageHome.fromMap(value);
        image.id = key;
        images.add(image);
      });
    } catch (e) {
      print(e);
    }
    return images;
  }
}
