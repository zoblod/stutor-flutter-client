import 'package:flutter/material.dart';
import 'package:stutor/data/classes/stutor.dart';
import 'package:stutor/data/observers/home_observer.dart';

class TutorsResponse extends StatefulWidget {
  const TutorsResponse({Key? key}) : super(key: key);

  @override
  State<TutorsResponse> createState() => _TutorsResponse();
}

class _TutorsResponse extends State<TutorsResponse> {
  var observer = HomeObserver();

  var numTutors = 5;
  var selectedTutor = 0;

  var tutors = [
    Stutor("Jennifer Smith", "Starbucks", 35, 'Remote/IRL',
        ['Psychology', 'Computer Science'], 5.0),
    Stutor("Allison Osborne", "HBLL Library", 25, 'Remote/IRL',
        ['Computer Science'], 5.0),
    Stutor("Aida Parker", "BYU", 35, 'IRL', ['Mechanical engineering'], 4.9),
    Stutor("Jones Johnson", "N/A", 15, 'Remote', ['Finance'], 4.5),
    Stutor("James Hinge", "Anywhere", 30, 'Remote/IRL', ['Psychology'], 5.0)
  ];

  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xFFDB4B6D), Color(0xFFE44584)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 80.0));

  get child => null;

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
        child: Column(children: [
          Row(
            children: [
              SafeArea(
                top: true,
                bottom: false,
                child: FittedBox(
                  child: TextButton(
                    onPressed: () {},
                    child: Image.asset('assets/icons/Union_1.png'),
                  ),
                ),
              ),
              const Spacer(),
              SafeArea(
                top: true,
                bottom: false,
                child: FittedBox(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('//');
                    },
                    child: const Text('Cancel'),
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            top: false,
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 20, 30.0, 0),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  children: [
                    Text(
                      "Select a",
                      textScaleFactor: 3.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          foreground: Paint()..shader = linearGradient),
                    ),
                    Text(
                      "stutor!",
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
          SizedBox(
            width: (MediaQuery.of(context).size.width - 25),
            height: (MediaQuery.of(context).size.height / 1.5),
            child: SafeArea(
              bottom: true,
              child: SizedBox(
                width: (MediaQuery.of(context).size.width - 25),
                height: (MediaQuery.of(context).size.height / 1.5),
                child: ListView.builder(
                  itemCount: numTutors,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTutor = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: SizedBox(
                          height: selectedTutor == index ? 260 : 200,
                          width: (MediaQuery.of(context).size.width - 50),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: ClipPath(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        (MediaQuery.of(context).size.width / 4),
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 0, 0),
                                          child: CircleAvatar(
                                            radius: 35,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFFCB556F),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 5, 20, 5),
                                                child: Text(
                                                  tutors[index]
                                                      .rating
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 50,
                                          child: Column(
                                            children: [
                                              Text(
                                                tutors[index].rate.toString() +
                                                    ' per hour',
                                                style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                tutors[index].preference,
                                                style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 13,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          tutors[index].name,
                                          style: const TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 20),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Image(
                                                  image: AssetImage(
                                                      'assets/icons/location.png'),
                                                  color: Colors.black,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          5, 0, 0, 0),
                                                  child: Text(
                                                    tutors[index].location,
                                                    style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 25),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.5),
                                                height: 50,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: tutors[index]
                                                        .classes
                                                        .length,
                                                    itemBuilder:
                                                        (context, index2) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 10, 10, 10),
                                                        child: Container(
                                                            decoration: const BoxDecoration(
                                                                color: Color(
                                                                    0x44CB556F),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      20,
                                                                      5,
                                                                      20,
                                                                      5),
                                                              child: Text(
                                                                  tutors[index]
                                                                          .classes[
                                                                      index2],
                                                                  style: const TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600)),
                                                            )),
                                                      );
                                                    }),
                                              )
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: selectedTutor == index
                                              ? true
                                              : false,
                                          child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .popAndPushNamed('//');
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFFCB556F),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: const Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      20, 10, 20, 10),
                                                  child: Text(
                                                    'choose me',
                                                    style: TextStyle(
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
                    );
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
