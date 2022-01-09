import 'package:flutter/material.dart';
import 'package:rfk/Widgets/LoginStyle.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;

    double anchoCard = 0.0;
    if (ancho > 300 && ancho < 640) {
      anchoCard = MediaQuery.of(context).size.width * 0.8;
    } else if (ancho >= 640 && ancho < 750) {
      anchoCard = MediaQuery.of(context).size.width * 0.7;
    } else if (ancho >= 750 && ancho < 1080) {
      anchoCard = MediaQuery.of(context).size.width * 0.5;
    } else {
      anchoCard = MediaQuery.of(context).size.width * 0.3;
    }

    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Form(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: anchoCard,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 10.0),
                            blurRadius: 15.0)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/img/rfk.jpg'),
                        radius: 60,
                        backgroundColor: Colors.transparent,
                      ),
                      titulo,
                      TextFormField(
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.alternate_email,
                            color: Colors.orange,
                          ),
                          hintText: 'ejemplo@gmail.com',
                          labelText: 'Correo Electrónico',
                          labelStyle: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        autocorrect: false,
                        obscureText: true,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.orange,
                          ),
                          hintText: "Contraseña",
                          labelText: "Contraseña",
                          labelStyle: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Ingresar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'registrar');
                        },
                        child: const Text(
                          'No tienes una cuenta?',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
