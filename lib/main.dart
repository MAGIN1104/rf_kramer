import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rfk/App.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'assets/environment/.env');
  runApp(MyApp());
}
