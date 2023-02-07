import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_armorial_user.g.dart';



@JsonSerializable()
class Armorial {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? description;
  final int? bookRequired;
  final int? giftPerBook;
  final int? bcoinOfLevel;
  final String? author;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;
  final String? editor;


  Armorial(this.id, this.name, this.description, this.bookRequired, this.giftPerBook, this.bcoinOfLevel, this.author, this.createdAt, this.updatedAt, this.v, this.editor);

  factory Armorial.fromJson(Map<String, dynamic> json) => _$ArmorialFromJson(json);

  Map<String, dynamic> toJson() => _$ArmorialToJson(this);
}

@JsonSerializable()
class ListArmorial {
  final int? total,currentPage,pageSize;
  final List<Armorial> records;


  ListArmorial(this.total, this.currentPage, this.pageSize, this.records);

  factory ListArmorial.fromJson(Map<String, dynamic> json) => _$ListArmorialFromJson(json);

  Map<String, dynamic> toJson() => _$ListArmorialToJson(this);
}


@JsonSerializable()
class ListArmorialResponse extends BaseResponse {
  final ListArmorial data;

  ListArmorialResponse(this.data);


  factory ListArmorialResponse.fromJson(Map<String, dynamic> json) => _$ListArmorialResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListArmorialResponseToJson(this);
}

