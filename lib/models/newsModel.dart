import 'dart:convert';

class NewsModel {
  NewsModel({
    required this.description,
    this.imageUrl,
    this.link,
    required this.title,
    this.urlVideo,
    this.date,
  });

  String description;
  String? imageUrl;
  String? link;
  String title;
  String? urlVideo;
  String? date;
  String? id;

  factory NewsModel.fromJson(String str) => NewsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsModel.fromMap(Map<String, dynamic> json) => NewsModel(
        description: json["description"],
        imageUrl: json["imageUrl"],
        link: json["link"],
        title: json["title"],
        urlVideo: json["urlVideo"],
        date: json["date"],
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "imageUrl": imageUrl,
        "link": link,
        "title": title,
        "urlVideo": urlVideo,
        "date": date,
      };
}
