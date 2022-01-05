import 'package:flutter/material.dart';
import 'package:rfk/Views/Login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RocaFiel Kramer',
      home: Login(),
    );
  }
}
