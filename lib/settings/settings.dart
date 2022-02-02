import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 30, 10),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Personal Info",
                          textScaleFactor: 1.5,
                          style: TextStyle(
                            color: Color(0xFF382E35),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 30, 10),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Notifications",
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Color(0xFF382E35),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 30, 10),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Refer a Friend",
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Color(0xFF382E35),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 30, 10),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Payment",
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Color(0xFF382E35),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 30, 10),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Privacy",
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Color(0xFF382E35),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 30, 10),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Legal",
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Color(0xFF382E35),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 30, 10),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Sign Out",
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                color: Color(0xFFE44584),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600))),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Divider(
                            thickness: 1.0,
                            color: Color(0xFFE44584),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            children: const [
                              Text("30",
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: 'Poppins')),
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
                                style: TextStyle(
                                    fontSize: 20, fontFamily: 'Poppins')),
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
                                  style: TextStyle(
                                      fontSize: 20, fontFamily: 'Poppins')),
                              Text("Months",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
