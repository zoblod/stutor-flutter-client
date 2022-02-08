import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:stutor/data/observers/home_observer.dart';
import 'package:stutor/home/request_splash.dart';

class Info4 extends StatefulWidget {
  const Info4({Key? key}) : super(key: key);

  @override
  State<Info4> createState() => _Info4();
}

class _Info4 extends State<Info4> {
  var selectedTypeIndex = 0;
  var observer = HomeObserver();

  var types = ['Homework', 'Test Prep', 'Other: '];

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xFFDB4B6D), Color(0xFFE44584)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 80.0));

  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(RequestSplashScreen());
    Future.delayed(const Duration(seconds: 4))
        .then((value) => Navigator.popAndPushNamed(context, '/tutorsResponse'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                              foreground: Paint()..shader = linearGradient),
                        ),
                        Text(
                          "a stutor!",
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
                              "Select a",
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFFCB556F)),
                            ),
                            Text(
                              "type",
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
                              _showOverlay(context);
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
                height: (MediaQuery.of(context).size.height / 2),
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
                      itemCount: types.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(types[index],
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                              )),
                          selectedColor: selectedTypeIndex == index
                              ? const Color(0xFFCB556F)
                              : null,
                          selected: selectedTypeIndex == index ? true : false,
                          onTap: () {
                            setState(() {
                              selectedTypeIndex = index;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              const Spacer()
            ],
          )),
    );
  }
}
