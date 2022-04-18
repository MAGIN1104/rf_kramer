import 'dart:convert';

class ImageHome {
  String img;
  String? id;
  ImageHome({
    required this.img,
  });

  factory ImageHome.fromJson(String str) => ImageHome.fromMap(json.decode(str));
  factory ImageHome.fromMap(Map<String, dynamic> json) => ImageHome(
        img: json["img"],
      );
}
