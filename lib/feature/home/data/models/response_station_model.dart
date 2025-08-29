import 'package:json_annotation/json_annotation.dart';

part 'response_station_model.g.dart';

@JsonSerializable()
class ResponseStationModel {
  String? name;
  String? url;
  @JsonKey(name: 'url_resolved')
  String? urlResolved;
  String? homepage;
  String? favicon;
  String? tags;
  String? codec;
  String? country;

  ResponseStationModel({
    this.name,
    this.url,
    this.urlResolved,
    this.homepage,
    this.favicon,
    this.tags,
    this.codec,
    this.country,
  });

  factory ResponseStationModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseStationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseStationModelToJson(this);
}

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}
