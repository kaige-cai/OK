// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoData _$VideoDataFromJson(Map<String, dynamic> json) => VideoData(
      douYinUrls: (json['dou-yin-urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      analyzeUrls: (json['analyze-urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tiktokUrls: (json['tiktok-urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$VideoDataToJson(VideoData instance) => <String, dynamic>{
      'dou-yin-urls': instance.douYinUrls,
      'analyze-urls': instance.analyzeUrls,
      'tiktok-urls': instance.tiktokUrls,
    };
