import 'package:flutter/material.dart';
import 'package:rfk/Views/Login.dart';
import 'package:rfk/Views/SignUp.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RocaFiel Kramer',
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        'registrar': (context) => SignUp(),
      },
    );
  }
}
