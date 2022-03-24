import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PetitionPage extends StatefulWidget {
  const PetitionPage({Key? key}) : super(key: key);

  @override
  State<PetitionPage> createState() => _PetitionPageState();
}

class _PetitionPageState extends State<PetitionPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset(
              "assets/img/img4.jpg",
              fit: BoxFit.fill,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Pedido de Oración",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Envianos tu pedio de oracion y junto al grupo de intercesión RocaFiel oraremos por tu necesidad.",
              style: TextStyle(fontFamily: 'Lato', fontSize: 15),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "Nombre",
                labelText: "Nombre",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "Celular/Teléfono",
                labelText: "Celular/Teléfono",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Pedido de Oración",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      "Enviar",
                      style: TextStyle(
                        color: Color(0xffc29b61),
                      ),
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.paperPlane,
                    color: Color(0xffc29b61),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
