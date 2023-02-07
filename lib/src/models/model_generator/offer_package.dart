import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'offer_package.g.dart';



@JsonSerializable()
class DataOfferPackage {
  @JsonKey(name: "_id")
  final String? id;
  final String? title;
  final int? savePercent;
  final int? type;
  final int? cost;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  DataOfferPackage(this.id, this.title, this.savePercent, this.type, this.cost, this.createdAt, this.updatedAt, this.v);

  factory DataOfferPackage.fromJson(Map<String, dynamic> json) => _$DataOfferPackageFromJson(json);

  Map<String, dynamic> toJson() => _$DataOfferPackageToJson(this);
}


@JsonSerializable()
class OfferPackageResponse extends BaseResponse {
  final List<DataOfferPackage> data;


  OfferPackageResponse(this.data);


  factory OfferPackageResponse.fromJson(Map<String, dynamic> json) => _$OfferPackageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OfferPackageResponseToJson(this);
}

