
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_history_wallet.g.dart';






@JsonSerializable()
class DataAut {
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? description;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? v;

  DataAut(this.id, this.name, this.description, this.isDeleted, this.createdAt, this.updatedAt, this.v);

  factory DataAut.fromJson(Map<String, dynamic> json) => _$DataAutFromJson(json);

  Map<String, dynamic> toJson() => _$DataAutToJson(this);
}

@JsonSerializable()
class DataHistoryWallet {
  @JsonKey(name: "_id")
  final String? id;
  final String? order_code;
  final double? bcoin;
  final bool? is_deleted;
  final String? create_at;
  final String? name;
  final String? image;
  final List<String>? images;
  final DataAut? author;

  DataHistoryWallet(this.id, this.order_code, this.bcoin, this.is_deleted, this.create_at, this.name, this.image, this.author, this.images);

  factory DataHistoryWallet.fromJson(Map<String, dynamic> json) => _$DataHistoryWalletFromJson(json);

  Map<String, dynamic> toJson() => _$DataHistoryWalletToJson(this);
}

@JsonSerializable()
class ListHistoryWallet {
  final int? total,currentPage,pageSize;
  final List<DataHistoryWallet>? records;


  ListHistoryWallet(this.total, this.currentPage, this.pageSize, this.records);

  factory ListHistoryWallet.fromJson(Map<String, dynamic> json) => _$ListHistoryWalletFromJson(json);

  Map<String, dynamic> toJson() => _$ListHistoryWalletToJson(this);
}

@JsonSerializable()
class ListHistoryWalletResponse extends BaseResponse{
  final ListHistoryWallet? data;

  ListHistoryWalletResponse(this.data);

  factory ListHistoryWalletResponse.fromJson(Map<String, dynamic> json) => _$ListHistoryWalletResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListHistoryWalletResponseToJson(this);
}