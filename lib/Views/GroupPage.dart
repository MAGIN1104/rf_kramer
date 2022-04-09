import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rfk/Widgets/ButtonLink.dart';
import 'package:rfk/models/groupModel.dart';
import 'package:url_launcher/url_launcher.dart';

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
          "Sábados a horas 18:00pm",
          "https://chat.whatsapp.com/CgPiwxCjAWFFPMTkEVv88z",
          "C/ Pedro Kramer #2022"),
      Groups(
          1,
          "Vuestro atavío no sea el externo de peinados ostentosos, de adornos de oro o de vestidos lujosos, sino el interno, el del corazón, en el incorruptible ornato de un espíritu afable y apacible, que es de grande estima delante de Dios.",
          "1 Pedro 3:3-4",
          "Lunes a horas 18:00pm",
          "",
          ""),
      Groups(
          2,
          "Alégrate, joven, en tu juventud; deja que tu corazón disfrute de la adolescencia. Sigue los impulsos de tu corazón y responde al estímulo de tus ojos, pero toma en cuenta que Dios te juzgará por todo esto.",
          "Eclesiastés 11:9",
          "Sábados a horas 15:00pm",
          "",
          ""),
      Groups(
          3,
          "Vuestro atavío no sea el externo de peinados ostentosos, de adornos de oro o de vestidos lujosos, sino el interno, el del corazón, en el incorruptible ornato de un espíritu afable y apacible, que es de grande estima delante de Dios.",
          "1 Pedro 3:3-4",
          "Sábados a horas 18:00pm",
          "",
          ""),
      Groups(
          5,
          "Vuestro atavío no sea el externo de peinados ostentosos, de adornos de oro o de vestidos lujosos, sino el interno, el del corazón, en el incorruptible ornato de un espíritu afable y apacible, que es de grande estima delante de Dios.",
          "1 Pedro 3:3-4",
          "Sábados a horas 17:00pm",
          "https://chat.whatsapp.com/CgPiwxCjAWFFPMTkEVv88z",
          "https://youtu.be/MpINBdiEaf8"),
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
            padding: const EdgeInsets.only(top: 20.0, left: 20),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesomeIcons.calendar,
                    color: Colors.green,
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
          ),
          (listMessage[groups.id].ubication != "")
              ? listMessage[groups.id].ubication.substring(0, 4) != "http"
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 20),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.locationDot,
                              color: Colors.red,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              listMessage[groups.id].ubication,
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
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 20),
                      child: TextButton(
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                FontAwesomeIcons.video,
                                color: Colors.red,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "Enlace del Meet",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                        onPressed: () async {
                          if (!await launch(listMessage[groups.id].ubication))
                            throw "Could not launch ${listMessage[groups.id].ubication}";
                        },
                      ),
                    )
              : Container(),
          (listMessage[groups.id].urlWhatsapp != "")
              ? Center(
                  child: ButtonLink(
                      url: listMessage[groups.id].urlWhatsapp,
                      textButton: "WhatsApp",
                      colorText: Colors.green,
                      icons: FontAwesomeIcons.whatsapp,
                      colorIcon: Colors.green))
              : Container()
        ],
      ),
    );
  }
}
