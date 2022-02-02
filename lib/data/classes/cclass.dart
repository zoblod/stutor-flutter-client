import 'class.dart';

class CClass extends Class {
  var professor = "";

  CClass(String abbr, String name, int number, this.professor)
      : super(abbr, name, number);
}
