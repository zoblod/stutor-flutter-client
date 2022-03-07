import 'package:stutor/data/models/user.dart';

class SessionStore {
  var authKey = "";
  var user = UserData("", "", "", [], "", "", [], "");

  SessionStore(this.authKey, this.user);
}
