/* User Data Class
 */

import 'package:stutor/data/models/class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserData {
  var firstName = "";
  var lastName = "";
  var email = "";
  var gender = "";
  var major = [];
  var status = "";
  var school = "";
  List<Class> classes = [];
  var style = "";

  /* basic constructor

    Args:
      firstName(String):
      lasttName(String):
      gender(String):
      major(String):    
      status(String): 
      school(String): 
      classes([Class]): 
  */
  UserData(this.firstName, this.lastName, this.gender, this.major, this.status,
      this.school, this.classes, this.style);

  /* converts the user object to a map to be converted later to json
  */
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
