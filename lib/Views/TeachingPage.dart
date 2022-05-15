import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeachingPage extends StatelessWidget {
  const TeachingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final listFake = [
      {
        "id": 1,
        "title": "Leche Espiritual",
        "description": "Fundamentos de la doctrina de Cristo",
        "imgUrl": "",
      },
      {
        "id": 2,
        "title": "Devocionales",
        "description": "Dosis diaria",
        "imgUrl": ""
      },
      {
        "id": 3,
        "title": "Alimento Solido",
        "description": "Alimento solido de la docrina de Cristo",
        "imgUrl": ""
      },
    ];
    return ListView.builder(
      itemCount: listFake.length,
      itemBuilder: ((context, index) {
        return Card(
          child: ListTile(
            title: Text(listFake[index]["title"].toString()),
            subtitle: Text(listFake[index]["description"].toString()),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        );
      }),
    );
  }
}
