import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions? get platformOptions {
    if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:629288037309:ios:d646729e3adb3eb41200d4',
        apiKey: 'AIzaSyACijtxqrpN-HPE2x_yzF4I2r2IQwKQ_hw',
        projectId: 'stutor-448b2',
        messagingSenderId: '448618578101',
        iosBundleId: 'com.example.stutor',
        iosClientId:
            '629288037309-ukt16rr106vqmrvjm61u84p6h6a9nog8.apps.googleusercontent.com',
        androidClientId:
            '448618578101-a9p7bj5jlakabp22fo3cbkj7nsmag24e.apps.googleusercontent.com',
        databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
        storageBucket: 'stutor-448b2.appspot.com',
      );
    } else {
      // Android
      log("Analytics Dart-only initializer doesn't work on Android, please make sure to add the config file.");

      return null;
    }
  }
}
