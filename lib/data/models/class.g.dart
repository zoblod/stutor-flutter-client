// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Class _$ClassFromJson(Map<String, dynamic> json) => Class(
      json['abbr'] as String,
      json['name'] as String,
      json['number'] as int,
      (json['professors'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ClassToJson(Class instance) => <String, dynamic>{
      'abbr': instance.abbr,
      'name': instance.name,
      'number': instance.number,
      'professors': instance.professors,
    };
