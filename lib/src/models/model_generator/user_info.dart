import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/index.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'user_info.g.dart';


@JsonSerializable()
class DataMembersShip {
  final String? id;
  final String? name;
  final String? description;
  final double? bcoin;


  const DataMembersShip(
      this.id,
      this.name,
      this.description,
      this.bcoin
      );

  factory DataMembersShip.fromJson(Map<String, dynamic> json) => _$DataMembersShipFromJson(json);

  Map<String, dynamic> toJson() => _$DataMembersShipToJson(this);
}

@JsonSerializable()
class DataUser {
  final String name;
  final String? avatar;
  final String email;
  final String? phone;
  final bool? gender;
  final String? dob;
  final String? referralId;
  final double? bcoin;
  final DataMembersShip? membership;


  const DataUser(
      this.name,
      this.avatar,
      this.email,
      this.phone,
      this.gender,
      this.dob,
      this.referralId,
      this.bcoin,
      this.membership
      );

  factory DataUser.fromJson(Map<String, dynamic> json) => _$DataUserFromJson(json);

  Map<String, dynamic> toJson() => _$DataUserToJson(this);
}

@JsonSerializable()
class DataResponse extends BaseResponse{
  final DataUser? data;


  DataResponse({
    this.data,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) => _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

