import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stutor/custom_views/picker_view.dart';
import 'package:stutor/data/observers/home_observer.dart';
import 'package:stutor/home/request_splash.dart';

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

  var major = ["Any", "Computer Science"];
  var majorIndex = 0;

  final helpType = ["Homework", "Exam", "Study"];
  var helpIndex = 0;

  int selectedMajorIndex = 0;

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xFFDB4B6D), Color(0xFFE44584)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 80.0));

  // ignore: unused_field
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _displayMajorPicker() async {
    final selectedMajor = await Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            transitionsBuilder:
                (__, Animation<double> animation, ____, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            pageBuilder: (BuildContext context, _, __) {
              return PickerView(
                list: major,
                type: 'selectedMajor',
                index: 0,
              );
            }));
    setState(() {
      majorIndex = selectedMajor;
    });
  }

  void _displayClassPicker() async {
    final selectedClass = await Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            transitionsBuilder:
                (__, Animation<double> animation, ____, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            pageBuilder: (BuildContext context, _, __) {
              return PickerView(
                list: classes,
                type: 'selectedClass',
                index: 0,
              );
            }));
    setState(() {
      classesIndex = selectedClass;
    });
  }

  void _displayTypePicker() async {
    final selectedType = await Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            transitionsBuilder:
                (__, Animation<double> animation, ____, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              );
            },
            pageBuilder: (BuildContext context, _, __) {
              return PickerView(
                list: helpType,
                type: 'selectedClass',
                index: 0,
              );
            }));
    setState(() {
      helpIndex = selectedType;
    });
  }

  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(RequestSplashScreen());
    Future.delayed(const Duration(seconds: 4))
        .then((value) => Navigator.popAndPushNamed(context, '/tutorsResponse'));
  }

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
                                SizedBox(
                                  height: 40,
                                  child: TextButton(
                                    onPressed: () {
                                      _displayMajorPicker();
                                    },
                                    child: Text(
                                      major[majorIndex],
                                      style: const TextStyle(
                                          color: Color(0xCC202020),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w100,
                                          fontSize: 18.0),
                                    ),
                                  ),
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
                                TextButton(
                                  onPressed: () {
                                    _displayClassPicker();
                                  },
                                  child: Text(
                                    classes[classesIndex],
                                    maxLines: 1,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Color(0xCC202020),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w100,
                                        fontSize: 18.0),
                                  ),
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
                                  TextButton(
                                    onPressed: () {
                                      _displayTypePicker();
                                    },
                                    child: Text(
                                      helpType[helpIndex],
                                      style: const TextStyle(
                                          color: Color(0xCC202020),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w100,
                                          fontSize: 18.0),
                                    ),
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
                                    height: 80,
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
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 11),
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
                                  70)),
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
                              _showOverlay(context);
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
