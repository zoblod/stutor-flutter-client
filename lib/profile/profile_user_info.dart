import 'package:flutter/material.dart';
import 'package:stutor/profile/profile.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Profile widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 25),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: [
            Column(
              // Majors
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                  child: Row(
                    children: [
                      const Text(
                        "Majors",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text("Add a Major",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFFE44584),
                                  fontFamily: 'Poppins',
                                ))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 20),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: [
                    for (var c in widget.observer.user.major)
                      FittedBox(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              color: const Color(0xFFDB4B6D)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: Text(
                              c,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
            Column(
              // Classes
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                    children: [
                      const Text(
                        "Classes",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text("Add a Class",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFFE44584),
                                  fontFamily: 'Poppins',
                                ))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 20),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 10,
                      children: [
                        for (var c in widget.observer.user.classes)
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.rectangle,
                                color: const Color(0xFFDB4B6D)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Text(
                                c.abbr + " " + c.number.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
