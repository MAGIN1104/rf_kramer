import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:rfk/App.dart';
import 'package:rfk/services/services.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'assets/environment/.env');
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewSevice())],
      child: MyApp(),
    );
  }
}
