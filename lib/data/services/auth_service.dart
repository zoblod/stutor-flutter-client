import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:stutor/data/models/school.dart';
import 'package:stutor/data/services/service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends Service {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var authToken = '';

  /* logs in the user into firebase then stores data on server

      Args:
        email(string): string of user's email
        password(string): string of user's password
   */
  Future<String> login(String email, String password) async {
    await loginToFirebase(email, password);

    return authToken;
  }

  /*  login into server and auth student

      Args:
        firstName(string): string of user's first name
        lastName(string): string of user's last name
  */
  Future<String> loginToBackend(String firstName, String lastName) async {
    await http.post(
      Uri.parse(
          'https://us-central1-stutor-448b2.cloudfunctions.net/api-student/v1/student'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + authToken
      },
      body: jsonEncode(
          <String, String>{'firstName': firstName, 'lastName': lastName}),
    );
    authToken = await auth.currentUser!.getIdToken(true);
    if (kDebugMode) {
      print(authToken);
    }
    return authToken;
  }

  /*  login into firebase

      Args:
        email(string): string of user's email
        password(string): string of user's password
  */
  Future<int> loginToFirebase(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (err) {
      if (handleError(err.hashCode) == 0) {
        try {
          await auth.createUserWithEmailAndPassword(
              email: email, password: password);
        } catch (err) {
          if (kDebugMode) {
            print(err.toString());
            print(err.hashCode);
          }
        }
      }
    } finally {
      // fetch auth token
      authToken = await auth.currentUser!.getIdToken();
    }
    return 0;
  }

  int handleError(int errorCode) {
    switch (errorCode) {
      // no account in database
      case 505284406:
        {
          return 0;
        }
      // network error
      case 271948972:
        {
          return 1;
        }
      // unexpected error
      default:
        {
          return -1;
        }
    }
  }

  /*  login into server and auth student

      Args:
        firstName(string): string of user's first name
        lastName(string): string of user's last name
  */

  Future<SchoolList> fetchUniversities() async {
    final response = await http.get(Uri.parse(
        'https://us-central1-stutor-448b2.cloudfunctions.net/api-student/v1/schools'));
    if (response.statusCode == 200) {
      return SchoolList.fromJson(json.decode(response.body)['schools']);
    }
    throw Error();
  }
}
