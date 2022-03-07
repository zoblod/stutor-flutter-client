import 'package:json_annotation/json_annotation.dart';
part 'class.g.dart';

@JsonSerializable()
class Class {
  var abbr = "";
  var name = "";
  var number = 0;
  var professors = [""];
  Class(this.abbr, this.name, this.number, this.professors);

  Map<String, dynamic> toJson() => _$ClassToJson(this);

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);
}
