// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_station_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseStationModel _$ResponseStationModelFromJson(
  Map<String, dynamic> json,
) => ResponseStationModel(
  name: json['name'] as String?,
  url: json['url'] as String?,
  urlResolved: json['url_resolved'] as String?,
  homepage: json['homepage'] as String?,
  favicon: json['favicon'] as String?,
  tags: json['tags'] as String?,
  codec: json['codec'] as String?,
);

Map<String, dynamic> _$ResponseStationModelToJson(
  ResponseStationModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'url': instance.url,
  'url_resolved': instance.urlResolved,
  'homepage': instance.homepage,
  'favicon': instance.favicon,
  'tags': instance.tags,
  'codec': instance.codec,
};
