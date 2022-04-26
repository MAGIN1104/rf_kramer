import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:rfk/models/models.dart';

class NewSevice extends ChangeNotifier {
  bool isLoading = true;
  final String _baseUrl = dotenv.get('API_URL');
  final List<NewsModel> newsList = [];
  NewSevice() {
    loadNews();
  }
  Future<List<NewsModel>> loadNews() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'news.json');
    try {
      final resp = await http.get(url);
      final Map<String, dynamic> dataResp = json.decode(resp.body);
      dataResp.forEach((key, value) {
        final newsData = NewsModel.fromMap(value);
        newsData.id = key;
        newsList.add(newsData);
      });
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
    return newsList;
  }
}
