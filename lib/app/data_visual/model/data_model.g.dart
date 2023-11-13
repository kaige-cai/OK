// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      value: json['value'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      pic: json['pic'] as String,
      desc: json['desc'] as String,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'value': instance.value,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'desc': instance.desc,
      'pic': instance.pic,
    };
