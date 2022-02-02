import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AuthStatus { emailLinkSent, isLoading }

class LoginObserver {
  bool success = false;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final noAccountHashCode = 505284406;
  final networkError = 271948972;

  // login / signin into firebase with email and password
  // if user has no account create one and initiate the app
  Future<int> loginToFirebase() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);
    } catch (err) {
      if (kDebugMode) {
        print(err.toString());
        print(err.hashCode);
      }
      if (handleError(err.hashCode) == 0) {
        try {
          await auth.createUserWithEmailAndPassword(
              email: emailTextController.text,
              password: passwordTextController.text);
        } catch (err) {
          if (kDebugMode) {
            print(err.toString());
            print(err.hashCode);
          }
        }
      }
    } finally {
      // Store user key
      if (kDebugMode) {
        print(auth.currentUser!.uid);
      }
    }
    return 1;
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
}
