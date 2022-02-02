import 'package:firebase_auth/firebase_auth.dart';

// handles authentication request to firebase
class AuthenticationHandler {
  final FirebaseAuth auth = FirebaseAuth.instance;

  get user => auth.currentUser;

  var acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
      url: 'https://www.stutor.page.link',
      // This must be true
      handleCodeInApp: true,
      iOSBundleId: 'com.joeljoseph.stutor',
      androidPackageName: 'com.example.stutor',
      // installIfNotAvailable
      androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: '12');

  // Send link to email
  Future<void> sendSignInWithEmailLink(String email) {
    return auth.sendSignInLinkToEmail(email: email, actionCodeSettings: acs);
  }

  // sign in with the link
  Future<UserCredential> signInWithEmail(String email, String link) {
    return auth.signInWithEmailLink(email: email, emailLink: link);
  }
}
