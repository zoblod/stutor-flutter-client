import 'package:flutter/material.dart';
import 'package:stutor/data/classes/class.dart';

class HomeObserver {
  final commentsController = TextEditingController();

  var newUser = true;

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

  var userMajor = "";

  var csClasses = [
    Class('CS', 'Introduction to Computer Programming', 142),
    Class('CS', 'Introduction to Data Science', 180),
    Class('CS', 'Introduction to Computer Systems', 224),
    Class('CS', 'Data Structures and Algorithms', 235),
    Class('CS', 'Discrete Structures', 236),
    Class('CS', 'Advanced Programming Concepts', 240),
    Class('CS', 'Web Programming', 260),
    Class('CS', 'Algorithm Design and Analysis', 312),
    Class('CS', 'Algorithm Design and Analysis', 324)
  ];

  late Class selectedClass;
}
