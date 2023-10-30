import 'package:json_annotation/json_annotation.dart';

part 'video_data.g.dart';

@JsonSerializable()
class VideoData {
  @JsonKey(name: 'dou-yin-urls') // 使用@JsonKey自定义字段名
  final List<String> douYinUrls;

  @JsonKey(name: 'analyze-urls')
  final List<String> analyzeUrls;

  @JsonKey(name: 'tiktok-urls')
  final List<String> tiktokUrls;

  VideoData({
    required this.douYinUrls,
    required this.analyzeUrls,
    required this.tiktokUrls,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) =>
      _$VideoDataFromJson(json);

  Map<String, dynamic> toJson() => _$VideoDataToJson(this);
}
