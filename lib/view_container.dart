import 'package:flutter/material.dart';
import 'package:stutor/home/home.dart';
import 'package:stutor/profile/profile.dart';
import 'package:stutor/settings/settings.dart';

class ViewContainer extends StatefulWidget {
  const ViewContainer({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ViewContainer> createState() => _ViewContainer();
}

class _ViewContainer extends State<ViewContainer> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Index 0: Calendar',
    ),
    const Text(
      'Index 1: Messages',
    ),
    const Home(),
    const Profile(),
    const Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
        child: _widgetOptions.elementAt(_selectedIndex),
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
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/calendar.png',
                  width: 30,
                  height: 30,
                  color: _selectedIndex == 0
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
                  color: _selectedIndex == 1
                      ? const Color(0xFFDB4B6D)
                      : const Color(0xFFFFFFFF),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/Union.png',
                  width: 50,
                  height: 50,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/user.png',
                  width: 30,
                  height: 30,
                  color: _selectedIndex == 3
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
                  color: _selectedIndex == 4
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
