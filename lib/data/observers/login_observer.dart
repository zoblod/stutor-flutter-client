import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stutor/data/models/class.dart';
import 'package:stutor/data/models/school.dart';
import 'package:stutor/data/models/user.dart';
import 'package:stutor/data/services/auth_service.dart';

class LoginObserver extends ChangeNotifier {
  bool success = false;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final GlobalKey<FormState> infoKey = GlobalKey<FormState>();

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final authService = AuthService();

  var user = UserData("", "", "", [], "", "", [], "");
  var universities = ["Brigham Young University", "University of Utah"];
  SchoolList? schools;
  var majors = [
    'Psychology',
    'Exercise Psychology',
    'Computer Science',
    'Economics',
    'Finance',
    'Accounting',
    'Health and physical education/fitness',
    'Family systems',
    'Mechanical engineering',
    'Elementary education and teaching',
  ];
  var classes = [
    Class('CS', 'Introduction to Computer Programming', 142, []),
    Class('CS', 'Introduction to Data Science', 180, []),
    Class('CS', 'Introduction to Computer Systems', 224, []),
    Class('CS', 'Data Structures and Algorithms', 235, []),
    Class('CS', 'Discrete Structures', 236, []),
    Class('CS', 'Advanced Programming Concepts', 240, []),
    Class('CS', 'Web Programming', 260, []),
    Class('CS', 'Algorithm Design and Analysis', 312, []),
    Class('CS', 'Algorithm Design and Analysis', 324, [])
  ];

  /*  Logs user into Stutor
        - calls auth service to authenticate user
   */
  void login() async {
    user.email = emailTextController.text;
    authService.login(emailTextController.text, passwordTextController.text);
  }

  /*  Creates user data in database
        - calls service to create user data

      Args:
        token(String): auth token
        userData(User): user data to add to database
   */
  void createUserData() {}

  /*  Fetches the universities from the database
        - calls service to fetch universities
   */
  void getUniversities() {}

  /*  Fetches the majors from the university from the database
        - calls service to fetch majors

      Args:
        univeristy(String): university name to fetch majors from
   */
  void getMajors(String university) {}

  /*  Fetches the classes from the university from the database
        - calls service to fetch classes

      Args:
        univeristy(String): university name to fetch classes from
   */
  void getClasses(String university) {}

  /* Saves user data locally
   */
  void storeUserData() async {
    final prefs = await SharedPreferences.getInstance();
    var encoded = json.encode(user);
    prefs.setString('user', encoded);
  }

  void fetchUniversities() async {
    schools = await authService.fetchUniversities();
  }
}
