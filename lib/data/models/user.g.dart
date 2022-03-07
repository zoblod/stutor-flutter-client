// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      json['firstName'] as String,
      json['lastName'] as String,
      json['gender'] as String,
      json['major'] as List<dynamic>,
      json['status'] as String,
      json['school'] as String,
      (json['classes'] as List<dynamic>)
          .map((e) => Class.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['style'] as String,
    )..email = json['email'] as String;

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'gender': instance.gender,
      'major': instance.major,
      'status': instance.status,
      'school': instance.school,
      'classes': instance.classes,
      'style': instance.style,
    };
