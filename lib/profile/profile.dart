import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              top: true,
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Container(
                        width: 150.0,
                        height: 200.0,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Spacer()
                    ]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                "Student:#5578",
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 150,
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle, color: Color(0xFF382E35)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                      "Joel Joseph",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Brigham Young University, Provo UT",
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    thickness: 1.0,
                    height: 0,
                    color: Color(0xFFE44584),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 50),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      children: const [
                        Text("30",
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'Poppins')),
                        Text("Sessions",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            )),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: const [
                      Text("4.9",
                          style:
                              TextStyle(fontSize: 20, fontFamily: 'Poppins')),
                      Text("Rating",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ))
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Column(
                      children: const [
                        Text("3",
                            style:
                                TextStyle(fontSize: 20, fontFamily: 'Poppins')),
                        Text("Months",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Text(
              "BIO",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
              child: Text(
                "I am a current senior completeing my last semester in the econ program at BYU. I am taking Economics 110 and advanced mathmatics and serving as a long time TA for both classes...",
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const Text(
              "CLASSES",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
