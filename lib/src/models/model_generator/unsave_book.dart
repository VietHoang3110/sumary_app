
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'unsave_book.g.dart';

@JsonSerializable()
class BookUnsave{
  @JsonKey(name: "_id")
  final String? id;

  BookUnsave(this.id);

  factory BookUnsave.fromJson(Map<String, dynamic> json) => _$BookUnsaveFromJson(json);

  Map<String, dynamic> toJson() => _$BookUnsaveToJson(this);
}

@JsonSerializable()
class UnsaveBookResponse  extends BaseResponse{

  UnsaveBookResponse? data;

  UnsaveBookResponse(this.data);

  factory UnsaveBookResponse.fromJson(Map<String, dynamic> json) => _$UnsaveBookResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnsaveBookResponseToJson(this);
}
