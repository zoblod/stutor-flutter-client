import 'package:flutter/material.dart';

class ProfileBio extends StatelessWidget {
  const ProfileBio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: SizedBox(
        width: (MediaQuery.of(context).size.width - 25),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                child: Row(
                  children: [
                    const Text(
                      "Bio",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text("Edit Bio",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFE44584),
                                fontFamily: 'Poppins',
                              ))),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 25, 20),
                child: Text(
                  "I am a current senior completeing my last semester in the econ program at BYU. I am taking Economics 110 and advanced mathmatics and serving as a long time TA for both classes...",
                  style: TextStyle(
                      fontFamily: 'Poppins', overflow: TextOverflow.visible),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
