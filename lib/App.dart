import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rfk/Views/GeneralPage.dart';
import 'package:rfk/services/home_service.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xffc29b61)),
        inputDecorationTheme: const InputDecorationTheme(
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.red,
            )),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.red,
            )),
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
      initialRoute: 'general',
      routes: {
        'general': (_) => const GeneralPage(),
      },
    );
  }
}
