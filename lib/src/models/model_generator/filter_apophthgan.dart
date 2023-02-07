import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'filter_apophthgan.g.dart';

@JsonSerializable()
class ApophthganFilter {
  @JsonKey(name: "_id")
  final String? id;
  final String? mood;
  final String? reason;
  final String? pathImage;
  final String? author;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;


  ApophthganFilter(
      this.id,
      this.author,
      this.v, this.mood, this.reason,
      this.pathImage, this.createdAt,
      this.updatedAt,);

  factory ApophthganFilter.fromJson(Map<String, dynamic> json) => _$ApophthganFilterFromJson(json);

  Map<String, dynamic> toJson() => _$ApophthganFilterToJson(this);
}

@JsonSerializable()
class ApophthganFilterResponse extends BaseResponse{
  List<ApophthganFilter>? data;

  ApophthganFilterResponse(this.data);
  factory ApophthganFilterResponse.fromJson(Map<String, dynamic> json) => _$ApophthganFilterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApophthganFilterResponseToJson(this);
}