import 'package:flutter/material.dart';
import 'package:stutor/data/observers/home_observer.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
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
        body: Container(
            width: (MediaQuery.of(context).size.width),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(64, 44, 60, 1),
              image: DecorationImage(
                  image: ExactAssetImage('assets/graphics/pad_lines.png'),
                  fit: BoxFit.fitHeight),
            ),
            child: Column(children: [
              SafeArea(
                  bottom: false,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 20, 30.0, 0),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          children: [
                            SizedBox(
                              width: (MediaQuery.of(context).size.width - 50),
                              child: Row(
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Appointments/",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          "Calendar",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))),
              SafeArea(
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: SizedBox(
                      height: 260,
                      width: (MediaQuery.of(context).size.width - 25),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: ClipPath(
                          child: Row(
                            children: [
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 4),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: CircleAvatar(
                                        radius: 35,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 5, 20, 5),
                                        child: Text(
                                          '5.0',
                                          style: TextStyle(
                                              color: Color(0xFFCB556F),
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                      child: Text(
                                        'Feb. 21',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFFCB556F),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      child: Column(
                                        children: const [
                                          Text(
                                            '35 per hour',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Remote/IRL',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 13,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Jennifer Smith',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                              3),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 8),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Image(
                                              image: AssetImage(
                                                  'assets/icons/location.png'),
                                              color: Colors.black,
                                              width: 20,
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 0, 0, 0),
                                              child: Text(
                                                'Starbucks',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Econ * Econ 110 * Homework',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                              1.5),
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 15, 0, 0),
                                            child: Text(
                                              '11:30am - 1:00pm',
                                              style: TextStyle(
                                                  color: Color(0xFFCB556F),
                                                  fontSize: 20,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          const Spacer(),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .popAndPushNamed(
                                                        '/messages');
                                              },
                                              child: Image.asset(
                                                'assets/icons/message-notif.png',
                                                color: Colors.black,
                                                width: 30,
                                              ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 0, 0),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Color(0xFFCB556F),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  25, 10, 25, 10),
                                              child: Text(
                                                'start session!',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ])));
  }
}
