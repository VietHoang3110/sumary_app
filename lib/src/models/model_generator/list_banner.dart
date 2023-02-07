import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_banner.g.dart';



@JsonSerializable()
class DataBanner {
  @JsonKey(name: "_id")
  final String? id;
  final String? author;
  final String? link;
  final String? imageUrl;
  final bool? enabled;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;


  DataBanner(this.id, this.author, this.link, this.imageUrl, this.enabled, this.createdAt, this.updatedAt, this.v);

  factory DataBanner.fromJson(Map<String, dynamic> json) => _$DataBannerFromJson(json);

  Map<String, dynamic> toJson() => _$DataBannerToJson(this);
}

@JsonSerializable()
class ListBanner {
  final int? total,currentPage,pageSize;
  final List<DataBanner> records;


  ListBanner(this.total, this.currentPage, this.pageSize, this.records);

  factory ListBanner.fromJson(Map<String, dynamic> json) => _$ListBannerFromJson(json);

  Map<String, dynamic> toJson() => _$ListBannerToJson(this);
}


@JsonSerializable()
class ListBannerResponse extends BaseResponse {
  final ListBanner data;


  ListBannerResponse(this.data);


  factory ListBannerResponse.fromJson(Map<String, dynamic> json) => _$ListBannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListBannerResponseToJson(this);
}

