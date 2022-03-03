import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:stutor/intro/info4.dart';
import 'package:stutor/data/observers/home_observer.dart';

class Info3 extends StatefulWidget {
  const Info3({Key? key}) : super(key: key);

  @override
  State<Info3> createState() => _Info3();
}

class _Info3 extends State<Info3> {
  var selectedClassIndex = 0;

  List<int> selectedClasses = [];

  var observer = HomeObserver();
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xFFDB4B6D), Color(0xFFE44584)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 80.0));

  @override
  void initState() {
    super.initState();
    // fetch classes from university
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                              "Select your current",
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFFCB556F)),
                            ),
                            Text(
                              "classes",
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
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Info4()));
                            },
                            child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: Image.asset('assets/icons/Union_1.png')),
                          ),
                        ),
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
                      itemCount: observer.csClasses.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(observer.csClasses[index].name,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                              )),
                          subtitle: Text(observer.csClasses[index].abbr +
                              " " +
                              (observer.csClasses[index].number).toString()),
                          selectedColor: selectedClasses.contains(index)
                              ? const Color(0xFFCB556F)
                              : null,
                          selected:
                              selectedClasses.contains(index) ? true : false,
                          onTap: () {
                            if (selectedClasses.contains(index)) {
                              setState(() {
                                selectedClasses.remove(index);
                              });
                            } else {
                              setState(() {
                                selectedClasses.add(index);
                                observer.selectedClass =
                                    observer.csClasses[selectedClassIndex];
                              });
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
