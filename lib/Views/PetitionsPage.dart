import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:provider/provider.dart';
import 'package:rfk/models/PetitionModel.dart';
import 'package:rfk/services/petition_form_provider.dart';
import 'package:rfk/services/petitions_service.dart';
import 'package:motion_toast/motion_toast.dart';

class PetitionPage extends StatefulWidget {
  const PetitionPage({Key? key}) : super(key: key);

  @override
  State<PetitionPage> createState() => _PetitionPageState();
}

class _PetitionPageState extends State<PetitionPage> {
  final _name = TextEditingController();
  final _cellPhone = TextEditingController();
  final _petition = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PetitionFormProvider(PetitionModel(
          cellPhone: _cellPhone.text,
          name: _name.text,
          petition: _petition.text)),
      child:
          FormPetition(name: _name, cellPhone: _cellPhone, petition: _petition),
    );
    // return formPetition(name: _name, cellPhone: _cellPhone, petition: _petition);
  }
}

class FormPetition extends StatelessWidget {
  const FormPetition({
    Key? key,
    required TextEditingController name,
    required TextEditingController cellPhone,
    required TextEditingController petition,
  })  : _name = name,
        _cellPhone = cellPhone,
        _petition = petition,
        super(key: key);

  final TextEditingController _name;
  final TextEditingController _cellPhone;
  final TextEditingController _petition;

  @override
  Widget build(BuildContext context) {
    final petitionFormProvider = Provider.of<PetitionFormProvider>(context);
    final petition = petitionFormProvider.petition;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: petitionFormProvider.formKey,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.asset(
                "assets/img/img4.jpg",
                fit: BoxFit.cover,
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
                controller: _name,
                // initialValue: petition.name,
                // onChanged: (value) => petition.name = value,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El campo es requerido';
                  }
                  return null;
                },
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
                controller: _cellPhone,
                // initialValue: petition.cellPhone,
                // onChanged: (value) => petition.cellPhone = value,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El campo es requerido';
                  } else if (int.tryParse(value) != null) {
                    if (int.tryParse(value)! < 60000000 ||
                        int.tryParse(value)! > 79999999) {
                      return 'Número de celular incorrecto';
                    }
                  }
                },
                decoration: const InputDecoration(
                  // FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                  hintText: "Celular/Teléfono",
                  labelText: "Celular/Teléfono",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _petition,
                // initialValue: petition.petition,
                // onChanged: (value) => petition.petition = value,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 2,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: "Pedido de Oración",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El campo es requerido';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: OutlinedButton(
                onPressed: () async {
                  if (petitionFormProvider.isValidForm()) {
                    final createPetition = PetitionService();
                    final newPetition = PetitionModel(
                        cellPhone: _cellPhone.text,
                        name: _name.text,
                        petition: _petition.text);
                    final resp = await createPetition.postPetition(newPetition);
                    if (resp == -1) {
                      MotionToast.error(
                        title: const Text(
                          'Error',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        description: const Text(
                          'Verifica tu conexión a internet.',
                          softWrap: true,
                          style: TextStyle(fontSize: 12),
                        ),
                        position: MOTION_TOAST_POSITION.top,
                        animationType: ANIMATION.fromRight,
                        dismissable: true,
                        width: 300,
                      ).show(context);
                    } else {
                      MotionToast.success(
                        title: const Text(
                          'Correcto',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        description: const Text(
                          'Tu pedido de oración fue registrado.',
                          style: TextStyle(fontSize: 12),
                        ),
                        position: MOTION_TOAST_POSITION.top,
                        animationType: ANIMATION.fromRight,
                        dismissable: true,
                        width: 300,
                      ).show(context);
                      petitionFormProvider.formKey.currentState?.reset();
                      // _name.clear();
                      // _cellPhone.clear();
                      // _petition.clear();
                    }
                  }
                },
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
      ),
    );
  }
}
