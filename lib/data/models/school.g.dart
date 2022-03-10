// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

School _$SchoolFromJson(Map<String, dynamic> json) => School(
      json['name'] as String,
      json['abbr'] as String,
      json['logoURL'] as String,
      json['color'] as String,
    );

Map<String, dynamic> _$SchoolToJson(School instance) => <String, dynamic>{
      'name': instance.name,
      'abbr': instance.abbr,
      'logoURL': instance.logoURL,
      'color': instance.color,
    };

SchoolList _$SchoolListFromJson(Map<String, dynamic> json) => SchoolList(
      (json['schools'] as List<dynamic>)
          .map((e) => School.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchoolListToJson(SchoolList instance) =>
    <String, dynamic>{
      'schools': instance.schools,
    };
