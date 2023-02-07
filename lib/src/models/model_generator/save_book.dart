
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'save_book.g.dart';

@JsonSerializable()
class Book{
  @JsonKey(name: "_id")
  final String? id;

  Book(this.id);

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}

@JsonSerializable()
class SaveBookResponse  extends BaseResponse{

  SaveBookResponse? data;

  SaveBookResponse(this.data);

  factory SaveBookResponse.fromJson(Map<String, dynamic> json) => _$SaveBookResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SaveBookResponseToJson(this);
}
