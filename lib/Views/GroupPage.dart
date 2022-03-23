import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rfk/models/groupModel.dart';

class GroupPage extends StatelessWidget {
  final GroupModel groups;
  const GroupPage({Key? key, required this.groups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Groups> listMessage = [
      Groups(
          0,
          "Mira que te mando que te esfuerces y seas valiente; no temas ni desmayes, porque Jehová tu Dios estará contigo en dondequiera que vayas.",
          "Josué 1:9",
          "Reunión de varones, dias sábados a horas 18:00pm",
          "67084403"),
      Groups(
          1,
          "Vuestro atavío no sea el externo de peinados ostentosos, de adornos de oro o de vestidos lujosos, sino el interno, el del corazón, en el incorruptible ornato de un espíritu afable y apacible, que es de grande estima delante de Dios.",
          "1 Pedro 3:3-4",
          "Reunión de mujeres, dias lunes a horas 18:00pm",
          ""),
      Groups(
          2,
          "Alégrate, joven, en tu juventud; deja que tu corazón disfrute de la adolescencia. Sigue los impulsos de tu corazón y responde al estímulo de tus ojos, pero toma en cuenta que Dios te juzgará por todo esto.",
          "Eclesiastés 11:9",
          "Reunión JRF, dias sábados a horas 15:00pm",
          ""),
      Groups(
          3,
          "Vuestro atavío no sea el externo de peinados ostentosos, de adornos de oro o de vestidos lujosos, sino el interno, el del corazón, en el incorruptible ornato de un espíritu afable y apacible, que es de grande estima delante de Dios.",
          "1 Pedro 3:3-4",
          "Reunión Pre-Juveniles, dias sábados a horas 18:00pm",
          ""),
      Groups(
          5,
          "Vuestro atavío no sea el externo de peinados ostentosos, de adornos de oro o de vestidos lujosos, sino el interno, el del corazón, en el incorruptible ornato de un espíritu afable y apacible, que es de grande estima delante de Dios.",
          "1 Pedro 3:3-4",
          "Reunión Ovejitas de Jesús, dias sábados a horas 17:00pm",
          ""),
    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Image.asset(
                groups.img,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    groups.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Text(
                  listMessage[groups.id].mensaje,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Lato',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  listMessage[groups.id].versiculo,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Lato',
                      color: Colors.blueGrey,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesomeIcons.calendar,
                    color: Colors.red,
                  ),
                ),
                Flexible(
                  child: Text(
                    listMessage[groups.id].description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
