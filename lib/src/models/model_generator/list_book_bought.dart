import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_book_bought.g.dart';



@JsonSerializable()
class DataAuthor {

  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? description;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  DataAuthor(this.id, this.name, this.description, this.isDeleted, this.createdAt, this.updatedAt, this.v);

  factory DataAuthor.fromJson(Map<String, dynamic> json) => _$DataAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$DataAuthorToJson(this);
}

@JsonSerializable()
class ProductBoughtData {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final DataAuthor? author;
  final String? image;
  final List<String>? images;
  final String? updatedAt;


  ProductBoughtData(this.id, this.name, this.author, this.image, this.images, this.updatedAt);

  factory ProductBoughtData.fromJson(Map<String, dynamic> json) => _$ProductBoughtDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductBoughtDataToJson(this);
}

@JsonSerializable()
class DataProductBought {
  @JsonKey(name: "_id")
  final String? id;
  final String? user;
  final ProductBoughtData? product;


  @JsonKey(name: "__v")
  final int? v;

  DataProductBought(
      this.id,
      this.v, this.user, this.product,
      );

  factory DataProductBought.fromJson(Map<String, dynamic> json) => _$DataProductBoughtFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductBoughtToJson(this);
}

@JsonSerializable()
class ListProductBought {
  final int? total,currentPage,pageSize;
  final List<DataProductBought> records;


  ListProductBought(this.total, this.currentPage, this.pageSize, this.records);

  factory ListProductBought.fromJson(Map<String, dynamic> json) => _$ListProductBoughtFromJson(json);

  Map<String, dynamic> toJson() => _$ListProductBoughtToJson(this);
}
@JsonSerializable()
class ListBookBoughtResponse extends BaseResponse {
  final ListProductBought data;


  ListBookBoughtResponse(this.data);


  factory ListBookBoughtResponse.fromJson(Map<String, dynamic> json) => _$ListBookBoughtResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListBookBoughtResponseToJson(this);
}

