/*  School Object 
*/
import 'package:json_annotation/json_annotation.dart';
part 'school.g.dart';

@JsonSerializable()
class School {
  var name = "";
  var abbr = "";
  var logoURL = "";
  var color = "";

  /* Constructor
    
    Args:
      id(String):
      name(String):
      abbr(String):
      logoURL(String):    
      color(String): 
  */
  School(this.name, this.abbr, this.logoURL, this.color);

  /* To JSON 
      Convert class to json
   */
  Map<String, dynamic> toJson() => _$SchoolToJson(this);

  /* From JSON
      Convert from json
   */
  factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);
}

@JsonSerializable()
class SchoolList {
  final List<School> schools;
  SchoolList(this.schools);
  factory SchoolList.fromJson(json) => _$SchoolListFromJson({'schools': json});
  List toJson() => _$SchoolListToJson(this)['schools'];
}
