import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:stutor/data/observers/home_observer.dart';

import 'info3.dart';

class Info2 extends StatefulWidget {
  const Info2({Key? key}) : super(key: key);

  @override
  State<Info2> createState() => _Info2();
}

class _Info2 extends State<Info2> {
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

  int selectedMajorIndex = 0;

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xFFDB4B6D), Color(0xFFE44584)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 80.0));

  @override
  void initState() {
    super.initState();
    // fetch majors
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color(0xFF382E35),
          image: DecorationImage(
              image: ExactAssetImage('assets/graphics/pad_lines.png'),
              fit: BoxFit.fitHeight),
        ),
        child: Column(
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
                        "Tell us about",
                        textScaleFactor: 3.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            foreground: Paint()..shader = linearGradient),
                      ),
                      Text(
                        "yourself",
                        textScaleFactor: 3.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            foreground: Paint()..shader = linearGradient),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SizedBox(
                  width: (MediaQuery.of(context).size.width - 50),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Select your",
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                color: Color(0xFFCB556F)),
                          ),
                          Text(
                            "major",
                            textScaleFactor: 2.3,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFCB556F)),
                          )
                        ],
                      ),
                      const Spacer(),
                      Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Info3()));
                          },
                          child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: Image.asset('assets/icons/Union_1.png')),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width - 50),
              height: (MediaQuery.of(context).size.height / 1.6),
              child: SafeArea(
                bottom: true,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                  ),
                  child: ListView.builder(
                    itemCount: observer.majors.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(observer.majors[index],
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                            )),
                        selectedColor: selectedMajorIndex == index
                            ? const Color(0xFFCB556F)
                            : null,
                        selected: selectedMajorIndex == index ? true : false,
                        onTap: () {
                          setState(() {
                            selectedMajorIndex = index;
                            observer.userMajor =
                                observer.majors[selectedMajorIndex];
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
