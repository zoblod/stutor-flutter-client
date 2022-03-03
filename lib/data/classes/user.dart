import 'package:stutor/data/classes/class.dart';

class User {
  var firstName = "Joel";
  var lastName = "Joseph";
  var gender = "Male";
  var major = ["Computer Science"];
  var status = "Student";
  var university = "Brigham Young University";
  var classes = [
    Class("CS", "Intro to Computer Programming", 142, []),
    Class("HIST", "American Heritage", 101, []),
    Class("PHY", "Intro to Physics", 101, []),
    Class("CS", "Deep Learning", 474, [])
  ];

  User(this.firstName, this.lastName, this.gender, this.major, this.status,
      this.university, this.classes);
}
