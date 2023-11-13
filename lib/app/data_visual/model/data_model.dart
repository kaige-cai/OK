import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  final String value;
  final String title;
  final String subtitle;
  final String desc;
  final String pic;

  DataModel({
    required this.value,
    required this.title,
    required this.subtitle,
    required this.pic,
    required this.desc,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
