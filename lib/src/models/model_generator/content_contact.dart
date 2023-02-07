
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'content_contact.g.dart';

@JsonSerializable()
class DataContentContactAddresses {

  final String location;

  DataContentContactAddresses(this.location);

  factory DataContentContactAddresses.fromJson(Map<String, dynamic> json) => _$DataContentContactAddressesFromJson(json);
  Map<String, dynamic> toJson() => _$DataContentContactAddressesToJson(this);
}

@JsonSerializable()
class DataContentContact {

  final String phone;
  final String email;
  final String website;
  final String fanpage;
  final List<DataContentContactAddresses> addresses;

  DataContentContact(this.phone, this.email, this.website, this.fanpage, this.addresses);

  factory DataContentContact.fromJson(Map<String, dynamic> json) => _$DataContentContactFromJson(json);
  Map<String, dynamic> toJson() => _$DataContentContactToJson(this);
}

@JsonSerializable()
class ContentContact {

  final DataContentContact data;

  ContentContact(this.data);

  factory ContentContact.fromJson(Map<String, dynamic> json) => _$ContentContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContentContactToJson(this);
}


@JsonSerializable()
class DataContact {
  final String? title;
  final ContentContact content;

  DataContact(this.title, this.content);

  factory DataContact.fromJson(Map<String, dynamic> json) => _$DataContactFromJson(json);
  Map<String, dynamic> toJson() => _$DataContactToJson(this);
}

@JsonSerializable()
class ContentContactResponse extends BaseResponse{
  final DataContact? data;

  ContentContactResponse(this.data) ;

  factory ContentContactResponse.fromJson(Map<String, dynamic> json) => _$ContentContactResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ContentContactResponseToJson(this);
}