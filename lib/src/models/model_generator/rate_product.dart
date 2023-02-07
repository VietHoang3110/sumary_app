
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'rate_product.g.dart';

@JsonSerializable()
class User{
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? avatar;


  User(this.id, this.name, this.avatar);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class DataRateProduct{
  @JsonKey(name: "_id")
  String? id;
  String? content;
  User? user;
  String? product;
  int? voiceStar;
  int? contentStar;
  List<String>? lover;
  bool? accepted;
  List<String>? replies;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  bool? isLoved;

  DataRateProduct(
      {this.id,
        this.content,
        this.user,
        this.product,
        this.voiceStar,
        this.contentStar,
        this.lover,
        this.accepted,
        this.replies,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.isLoved});

  factory DataRateProduct.fromJson(Map<String, dynamic> json) => _$DataRateProductFromJson(json);

  Map<String, dynamic> toJson() => _$DataRateProductToJson(this);
}
@JsonSerializable()
class ListRateProduct{
  final List<DataRateProduct>? records;
  final int? total,currentPage,pageSize;


  ListRateProduct(this.records, this.total, this.currentPage, this.pageSize);

  factory ListRateProduct.fromJson(Map<String, dynamic> json) => _$ListRateProductFromJson(json);

  Map<String, dynamic> toJson() => _$ListRateProductToJson(this);
}

@JsonSerializable()
class RateProductResponse  extends BaseResponse{

  ListRateProduct? data;


  RateProductResponse(this.data);

  factory RateProductResponse.fromJson(Map<String, dynamic> json) => _$RateProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RateProductResponseToJson(this);
}
