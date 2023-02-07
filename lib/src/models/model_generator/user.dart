// import 'package:json_annotation/json_annotation.dart';
// import 'package:sumary_app/src/models/index.dart';
//
// part 'user.g.dart';
//
// @JsonSerializable()
// class UserResponse {
//   final bool? status;
//   final DataUserr? data;
//   final String? message;
//
//   const UserResponse({this.status, this.message, this.data});
//
//   static const empty =  UserResponse(status: true, data: null, message: '');
//
//   factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
//
//   Map<String, dynamic> toJson() => _$UserResponseToJson(this);
// }
//
// @JsonSerializable()
// class DataUserr {
//   final String? token;
//   final InfoUser? user;
//
//   const DataUserr({this.token, this.user});
//
//   static const empty =  DataUserr(user: null, token: '');
//
//   factory DataUserr.fromJson(Map<String, dynamic> json) => _$DataUserrFromJson(json);
//
//   Map<String, dynamic> toJson() => _$DataUserrToJson(this);
// }
