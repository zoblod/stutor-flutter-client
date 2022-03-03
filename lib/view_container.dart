import 'package:flutter/material.dart';
import 'package:stutor/calendar/calendar.dart';
import 'package:stutor/data/observers/home_observer.dart';
import 'package:stutor/home/home.dart';
import 'package:stutor/messages/messages.dart';
import 'package:stutor/profile/profile.dart';
import 'package:stutor/settings/settings.dart';

// ignore: must_be_immutable
class ViewContainer extends StatefulWidget {
  ViewContainer({Key? key, required this.state}) : super(key: key);
  int state;
  @override
  State<ViewContainer> createState() => _ViewContainer();
}

class _ViewContainer extends State<ViewContainer> {
  var homeObserver = HomeObserver();

  static final List<Widget> _widgetOptions = <Widget>[
    const Calendar(),
    const Messages(),
    const Home(),
    const Profile(),
    const Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.state = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        top: false,
        bottom: false,
        maintainBottomViewPadding: false,
        child: _widgetOptions.elementAt(widget.state),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomNavigationBar(
            elevation: 10.0,
            unselectedItemColor: const Color(0xFFFFFFFF),
            unselectedIconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
            selectedItemColor: const Color(0xFFDB4B6D),
            selectedIconTheme: const IconThemeData(color: Color(0xFFDB4B6D)),
            backgroundColor: const Color(0xFF282828),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: widget.state,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/calendar.png',
                  width: 30,
                  height: 30,
                  color: widget.state == 0
                      ? const Color(0xFFDB4B6D)
                      : const Color(0xFFFFFFFF),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/message.png',
                  width: 30,
                  height: 30,
                  color: widget.state == 1
                      ? const Color(0xFFDB4B6D)
                      : const Color(0xFFFFFFFF),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/Union.png',
                    width: 50,
                    height: 50,
                    color: widget.state == 2 || widget.state > 4
                        ? const Color(0xFFDB4B6D)
                        : const Color(0xFFFFFFFF)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/user.png',
                  width: 30,
                  height: 30,
                  color: widget.state == 3
                      ? const Color(0xFFDB4B6D)
                      : const Color(0xFFFFFFFF),
                ),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/setting.png',
                  width: 30,
                  height: 30,
                  color: widget.state == 4
                      ? const Color(0xFFDB4B6D)
                      : const Color(0xFFFFFFFF),
                ),
                label: 'Messages',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Int {}
