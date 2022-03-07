import 'package:flutter/material.dart';
import 'package:stutor/custom_views/picker_view.dart';
import 'package:stutor/data/models/class.dart';
import 'package:stutor/data/observers/home_observer.dart';
import 'package:stutor/home/request_splash.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.observer}) : super(key: key);
  final HomeObserver observer;
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  var observer = HomeObserver();

  late Future<List<Class>> classs;
  late Future<List> majors;
  late Future<List<String>> help;

  var classIndex = 0;
  var majorIndex = 0;

  final helpType = ["Homework", "Exam", "Study"];
  var helpIndex = 0;

  int selectedMajorIndex = 0;

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xFFDB4B6D), Color(0xFFE44584)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 80.0));

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
                list: observer.majors,
                type: 'selectedMajor',
                index: majorIndex,
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
                list: observer.classesString,
                type: 'selectedClass',
                index: classIndex,
              );
            }));
    setState(() {
      classIndex = selectedClass;
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
                type: 'selectedType',
                index: helpIndex,
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
  void initState() {
    super.initState();
    classs = Future<List<Class>>.delayed(
        const Duration(seconds: 1), () => observer.getClasses());
    majors = Future<List>.delayed(
        const Duration(seconds: 1), () => observer.getMajor());
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
                                      child: FutureBuilder<List>(
                                        future: majors,
                                        builder: (BuildContext context,
                                            AsyncSnapshot<List> snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(
                                              observer.majors[majorIndex],
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Color(0xCC202020),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 18.0),
                                            );
                                          } else {
                                            return Align(
                                                alignment:
                                                    const Alignment(0.0, 0.0),
                                                child: SizedBox(
                                                  width: (MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5),
                                                  height: 20,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.grey,
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors
                                                                  .black12,
                                                              offset: Offset(
                                                                  3.0, 6.0),
                                                              blurRadius: 10.0),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ));
                                          }
                                        },
                                      )),
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
                                    child: FutureBuilder<List<Class>>(
                                      future: classs,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<Class>> snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(
                                            observer.classesString[classIndex],
                                            maxLines: 1,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Color(0xCC202020),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w100,
                                                fontSize: 18.0),
                                          );
                                        } else {
                                          return Align(
                                              alignment:
                                                  const Alignment(0.0, 0.0),
                                              child: SizedBox(
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5),
                                                height: 20,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.grey,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            offset: Offset(
                                                                3.0, 6.0),
                                                            blurRadius: 10.0),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ));
                                        }
                                      },
                                    )),
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
