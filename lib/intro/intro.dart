import 'package:flutter/material.dart';
import 'package:stutor/intro/login.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _Intro();
}

class _Intro extends State<Intro> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Image.asset('assets/graphics/white_logo.png', scale: 1),
            const Spacer(
              flex: 3,
            ),
            TextButton(
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '  Login',
                    textScaleFactor: 1.5,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  )),
              style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(color: Colors.white),
                  )),
                  maximumSize:
                      MaterialStateProperty.all<Size>(const Size(300, 60))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
            ),
            const Spacer(flex: 2)
          ],
        ));
  }
}
