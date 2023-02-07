
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'get_armorial.g.dart';


@JsonSerializable()
class YourArmorial {
  final String? name;
  final String? username;
  final int? giftPerBook;
  final int? bcoinOfLevel;
  final int? myBook;
  final int? myBookRequireForUpAppellation;


  YourArmorial(this.name, this.username, this.giftPerBook, this.bcoinOfLevel, this.myBook, this.myBookRequireForUpAppellation);
  factory YourArmorial.fromJson(Map<String, dynamic> json) => _$YourArmorialFromJson(json);
  Map<String, dynamic> toJson() => _$YourArmorialToJson(this);
}

@JsonSerializable()
class YourArmorialResponse extends BaseResponse{
  final YourArmorial? data;

  YourArmorialResponse(this.data) ;

  factory YourArmorialResponse.fromJson(Map<String, dynamic> json) => _$YourArmorialResponseFromJson(json);
  Map<String, dynamic> toJson() => _$YourArmorialResponseToJson(this);
}