import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stutor/data/models/class.dart';
import 'package:stutor/data/models/user.dart';

class HomeObserver {
  HomeObserver() {
    loadUserData();
  }

  final commentsController = TextEditingController();
  var user = UserData("", "", "", [], "", "", [], "");
  List<String> classesString = [];
  List<String> majors = ['Any'];

  void loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      UserData data = UserData.fromJson(json.decode(prefs.getString('user')!));
      user = data;
      for (var m in user.major) {
        majors.add(m);
      }
      for (var c in user.classes) {
        classesString.add(c.name);
      }
    } catch (e) {
      if (kDebugMode) {
        print('no');
        print(e);
      }
    }
  }

  Future<List<Class>> getClasses() async {
    return user.classes;
  }

  Future<List> getMajor() async {
    return user.major;
  }
}
