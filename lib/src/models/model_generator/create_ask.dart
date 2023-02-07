
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'create_ask.g.dart';

@JsonSerializable()
class Book{
  @JsonKey(name: "_id")
  final String? id;

  Book(this.id);

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}

@JsonSerializable()
class CreateAsk {
  final String name;
  final String question;

  CreateAsk({
    required this.name,
    required this.question,
  });

  factory CreateAsk.fromJson(Map<String, dynamic> json) => _$CreateAskFromJson(json);
  Map<String, dynamic> toJson() => _$CreateAskToJson(this);
}


@JsonSerializable()
class CreateAskResponse  extends BaseResponse{

  CreateAskResponse? data;

  CreateAskResponse(this.data);

  factory CreateAskResponse.fromJson(Map<String, dynamic> json) => _$CreateAskResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAskResponseToJson(this);
}
