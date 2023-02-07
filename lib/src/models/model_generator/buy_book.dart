
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'buy_book.g.dart';

@JsonSerializable()
class BookBuy{
  @JsonKey(name: "_id")
  final String? id;

  BookBuy(this.id);

  factory BookBuy.fromJson(Map<String, dynamic> json) => _$BookBuyFromJson(json);

  Map<String, dynamic> toJson() => _$BookBuyToJson(this);
}

@JsonSerializable()
class PostBuyBook {
  final String payment_type;

  PostBuyBook(this.payment_type);

  factory PostBuyBook.fromJson(Map<String, dynamic> json) => _$PostBuyBookFromJson(json);
  Map<String, dynamic> toJson() => _$PostBuyBookToJson(this);
}


@JsonSerializable()
class BuyBookResponse  extends BaseResponse{

  BuyBookResponse? data;

  BuyBookResponse(this.data);

  factory BuyBookResponse.fromJson(Map<String, dynamic> json) => _$BuyBookResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuyBookResponseToJson(this);
}
