import 'data/classes/user.dart';

class SessionStore {
  var authKey = "";
  var user = User("", "", "", [], "", "", []);

  SessionStore(this.authKey, this.user);
}
