import 'package:flutter/material.dart';
import 'package:rfk/Views/GeneralPage.dart';
import 'package:rfk/Views/GroupPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xffc29b61)),
        inputDecorationTheme: const InputDecorationTheme(
            floatingLabelStyle: TextStyle(
              color: Color(0xffc29b61),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xffc29b61),
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xffc29b61),
            ))),
      ),
      title: 'RocaFiel Kramer',
      initialRoute: '/',
      routes: {
        '/': (_) => const GeneralPage(),
      },
    );
  }
}
