import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_background.g.dart';


@JsonSerializable()
class DataBackground {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;


  DataBackground(this.id, this.name, this.imageUrl, this.createdAt, this.updatedAt, this.v);

  factory DataBackground.fromJson(Map<String, dynamic> json) => _$DataBackgroundFromJson(json);

  Map<String, dynamic> toJson() => _$DataBackgroundToJson(this);
}


@JsonSerializable()
class ListBackgroundResponse extends BaseResponse {
  final List<DataBackground> data;


  ListBackgroundResponse(this.data);


  factory ListBackgroundResponse.fromJson(Map<String, dynamic> json) => _$ListBackgroundResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListBackgroundResponseToJson(this);
}

