import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rfk/Widgets/Constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String date = 'DD-MM-AAAA';

  Future fechaSeleccionar(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      helpText: 'Fecha de Naciento',
      initialDate: DateTime(2010),
      firstDate: DateTime(1940),
      lastDate: DateTime(2010),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            primarySwatch:  Colors.orange,
            primaryColor: Colors.orange,
          ),
          child:child!,
        )
      },
    );
    if (selectedDate != null) {
      setState(() {
        date = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }
  final phoneController= TextEditingController();

  @override

  void initState(){
    super.initState();
    phoneController.addListener(_printPhoneValue);
  }
  @override
  void dispose(){
    phoneController.dispose();
    super.dispose();
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: DraggableScrollableSheet(
          initialChildSize: 0.95,
          minChildSize: 0.95,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 30.0,
                    offset: Offset(10.0, 10.0),
                  )
                ],
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'REGISTRA TUS DATOS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato',
                            fontSize: 20.0),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      autocorrect: false,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orange, width: 2),
                        ),
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: Colors.orange,
                        ),
                        hintText: "Nombre Completo",
                        labelText: "Nombre Completo",
                        labelStyle: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orange, width: 2),
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline_sharp,
                          color: Colors.orange,
                        ),
                        hintText: "ejemplo@gmail.com",
                        labelText: "Correo Electronico",
                        labelStyle: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orange, width: 2),
                        ),
                        prefixIcon: Icon(
                          Icons.phone_android_rounded,
                          color: Colors.orange,
                        ),
                        hintText: "7xxxxxxx",
                        labelText: "Celular",
                        labelStyle: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      readOnly: true,
                      onTap: () {
                        setState(() {
                          fechaSeleccionar(context);
                        });
                      },
                      // initialValue: date,
                      decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2),
                          ),
                          prefixIcon: const Icon(
                            Icons.calendar_today_rounded,
                            color: Colors.orange,
                          ),
                          hintText: date,
                          labelStyle: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                          helperText: 'Fecha de Nacimiento'),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField(
                      hint: const Text('Género'),
                      items: const [
                      DropdownMenuItem(
                        value: 'Femenino',
                        child: Text('Femenino'),
                      ),
                      DropdownMenuItem(
                        value: 'Masculino',
                        child: Text('Masculino'),
                      )
                    ], onChanged: (value) {
                      print(value);
                    }),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: kbutton,
                      onPressed: () {},
                      child: const Center(
                        child: Text(
                          'REGISTRAR',
                          style: TextStyle(fontFamily: 'Lato'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  void _printPhoneValue(){
    print('Second text field: ${phoneController.text}');
  }
}
