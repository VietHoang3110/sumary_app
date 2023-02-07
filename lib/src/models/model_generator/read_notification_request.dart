import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/index.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'read_notification_request.g.dart';

// @JsonSerializable()
// class ReadNotificationRequest {
//   final String id;
//
//
//   ReadNotificationRequest(this.id);
//
//   factory ReadNotificationRequest.fromJson(Map<String, dynamic> json) => _$ReadNotificationRequestFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ReadNotificationRequestToJson(this);
// }

@JsonSerializable()
class ReadNotificationRequest {

  final String id;

  ReadNotificationRequest(this.id);
  factory ReadNotificationRequest.fromJson(Map<String, dynamic> json) => _$ReadNotificationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ReadNotificationRequestToJson(this);
}
