import 'package:flutter/material.dart';
import 'package:stutor/data/observers/home_observer.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _Messages();
}

class _Messages extends State<Messages> {
  var observer = HomeObserver();

  int selectedMajorIndex = 0;

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xFFDB4B6D), Color(0xFFE44584)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 80.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SafeArea(
          bottom: false,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 20, 30.0, 0),
              child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(children: [
                    SizedBox(
                        width: (MediaQuery.of(context).size.width - 50),
                        child: Row(children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Messages",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFE44584),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ])
                        ]))
                  ])))),
      SizedBox(
          width: (MediaQuery.of(context).size.width - 50),
          height: 100,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  'Jennifer Smith',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    //Navigator.of(context).popAndPushNamed('/messages');
                  },
                  child: Image.asset(
                    'assets/icons/message-notif.png',
                    color: Colors.black,
                    width: 30,
                  ))
            ],
          ))
    ]));
  }
}
