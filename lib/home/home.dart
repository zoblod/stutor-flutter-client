import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stutor/data/observers/home_observer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  var observer = HomeObserver();

  var classes = [
    "Intro to Computer Programming",
    "American Heritage",
    "Intro to Physics",
    "CS",
    "Deep Learning",
  ];
  var classesIndex = 0;

  var major = ["Any", "Computer Science", "Economics"];
  var majorIndex = 0;

  var helpType = ["Homework", "Exam", "Study"];
  var helpIndex = 0;

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xFFDB4B6D), Color(0xFFE44584)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 80.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 20, 30.0, 0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  children: [
                    Text(
                      "Let's find you",
                      textScaleFactor: 3.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          foreground: Paint()..shader = linearGradient),
                    ),
                    Text(
                      "a stutor!",
                      textScaleFactor: 3.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          foreground: Paint()..shader = linearGradient),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            bottom: true,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  shape: BoxShape.rectangle,
                  color: Colors.white),
              child: SizedBox(
                height: (MediaQuery.of(context).size.height / 2) + 50,
                width: (MediaQuery.of(context).size.width - 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "major:",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xFF382E35),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 25.0),
                                ),
                                Text(
                                  major[majorIndex],
                                  style: const TextStyle(
                                      color: Color(0xCC202020),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w100,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2.5),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "class:",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 25.0),
                                ),
                                Text(
                                  classes[majorIndex],
                                  maxLines: 1,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xCC202020),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w100,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 1,
                            child: Divider(
                              thickness: 1.0,
                              color: Color(0xFFE44584),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "type:",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 25.0),
                                  ),
                                  Text(
                                    helpType[helpIndex],
                                    style: const TextStyle(
                                        color: Color(0xCC202020),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w100,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Flexible(
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 1,
                            child: Divider(
                              thickness: 1.0,
                              color: Color(0xFFE44584),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "comments:",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 25.0),
                                  ),
                                  SizedBox(
                                    width: (MediaQuery.of(context).size.width /
                                        1.2),
                                    height: 100,
                                    child: TextField(
                                      controller: observer.commentsController,
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SafeArea(
                      bottom: true,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: TextButton(
                            child: Container(
                                alignment: Alignment.center,
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  child: Text(
                                    'find my stutor',
                                    textAlign: TextAlign.center,
                                    textScaleFactor: 1.8,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )),
                            style: ButtonStyle(
                              maximumSize: MaterialStateProperty.all<Size>(Size(
                                  (MediaQuery.of(context).size.width - 30),
                                  80)),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFFCB556F)),
                              splashFactory: NoSplash.splashFactory,
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side:
                                    const BorderSide(color: Color(0xFFCB556F)),
                              )),
                            ),
                            onPressed: () async {
                              //Navigator.push(context,
                              //  MaterialPageRoute(builder: (context) => const Login()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
      backgroundColor: const Color(0xFF382E35),
    );
  }
}
