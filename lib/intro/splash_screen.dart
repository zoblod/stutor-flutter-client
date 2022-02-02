import 'dart:async';
import 'package:stutor/intro/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Splash screen pops up at the start of app

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center);
  }

  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  bool isVisible = true;
  StatefulWidget next = const Login(); // defaults to intro screen

  @override
  void initState() {
    checkUser();
    Future.delayed(const Duration(seconds: 1)).then((value) => Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (c, a1, a2) => next,
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 350),
          ),
        ));
    super.initState();
  }

  // check if user is logged in
  // if true go straight to home
  // else go to intro page
  void checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId") ?? "Error";

    if (userId == "Error") {
      next = const Login();
    } else {
      //next = const Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(64, 44, 60, 1),
          image: DecorationImage(
              image: ExactAssetImage('assets/graphics/pad_lines.png'),
              fit: BoxFit.fitHeight),
        ),
        child: Image.asset('assets/graphics/white_logo.png'));
  }
}
