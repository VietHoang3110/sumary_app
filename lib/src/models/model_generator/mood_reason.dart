import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'mood_reason.g.dart';



@JsonSerializable()
class DataMoodAndReason {
  @JsonKey(name: "_id")
  final String id;
  final String iconPath;
  final String name;
  final String? type;
  final bool? isActivated;
  final String? author;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  DataMoodAndReason(this.id, this.iconPath, this.name, this.type, this.isActivated, this.author, this.createdAt, this.updatedAt, this.v);

  factory DataMoodAndReason.fromJson(Map<String, dynamic> json) => _$DataMoodAndReasonFromJson(json);

  Map<String, dynamic> toJson() => _$DataMoodAndReasonToJson(this);
}


@JsonSerializable()
class DataMoodAndReasonResponse extends BaseResponse {
  final List<List<DataMoodAndReason>> data;


  DataMoodAndReasonResponse(this.data);


  factory DataMoodAndReasonResponse.fromJson(Map<String, dynamic> json) => _$DataMoodAndReasonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataMoodAndReasonResponseToJson(this);
}

