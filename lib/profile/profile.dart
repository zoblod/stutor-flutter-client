import 'package:flutter/material.dart';
import 'package:stutor/data/observers/home_observer.dart';
import 'package:stutor/profile/profile_bio.dart';
import 'package:stutor/profile/profile_user_info.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  Profile({Key? key, required this.observer}) : super(key: key);
  HomeObserver observer;
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
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                      widget.observer.user.firstName +
                          " " +
                          widget.observer.user.lastName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.observer.user.school,
                      style: const TextStyle(
                          color: Colors.white, fontFamily: 'Poppins'),
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

            // Profile Bio Info
            const ProfileBio(),

            // Profile User Info
            ProfileUserInfo(widget: widget),

            // Space for the tab bar
            Container(
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
