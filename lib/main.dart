// Joel Joseph
// main.dart
// root of app

import 'package:flutter/material.dart';
import 'package:stutor/firebase_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stutor/home/response_request.dart';
import 'package:stutor/intro/splash_screen.dart';

import 'package:stutor/view_container.dart';

Future<void> main() async {
  // initialized firebase here because im used to it being here in iOS
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseConfig.platformOptions); // initialize firebase
  runApp(const Stutor());
}

class Stutor extends StatelessWidget {
  const Stutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        '//': (BuildContext context) => ViewContainer(
              state: 2,
            ),
        '/tutorsResponse': (BuildContext context) => const TutorsResponse(),
        '/messages': (BuildContext context) => ViewContainer(
              state: 1,
            ),
        '/appointments': (BuildContext context) => ViewContainer(
              state: 0,
            ),
      },
    );
  }
}
