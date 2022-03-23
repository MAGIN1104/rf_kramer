import 'dart:ffi';

import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<dynamic> data = [
    {
      "id": "1",
      "img": "assets/img/img4.jpg",
      "title": "Reunión de Varones",
      "description":
          "Sábado 20 de noviembre, reunión de varones Rocafiel Kramer.",
    },
    {
      "id": "2",
      "img": "assets/img/img2.jpg",
      "title": "Noticia 2",
      "description": "Description news to cards.",
    },
    {
      "id": "2",
      "img": "assets/img/img5.jpg",
      "title": "Reunión de Mujeres",
      "description":
          "Sábado 27 de noviembre, reunión de varones Rocafiel Kramer.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, int index) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Image.asset(
                  data[index]["img"],
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data[index]["title"],
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(data[index]["description"],
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
              ),
            ],
          ),
        );
      },
    );
  }
}
