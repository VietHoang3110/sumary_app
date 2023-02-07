import 'package:json_annotation/json_annotation.dart';
part 'params_change_info.g.dart';
@JsonSerializable()
class ParamChangeInfo {

  String? name;
  String? avatar;
  String? phone;

  ParamChangeInfo({
    this.avatar,
    required this.phone,
    required this.name,
  });

  factory ParamChangeInfo.fromJson(Map<String, dynamic> json) => _$ParamChangeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ParamChangeInfoToJson(this);

  List<Object?> get props => [phone,avatar,name ];
}

class ChangeInfoData {
  final String name;
  final String phone;


  ChangeInfoData(this.name, this.phone);
}

@JsonSerializable()
class ParamChangeInfoNotImage {
  String name;
  String phone;

  ParamChangeInfoNotImage({

    required this.phone,
    required this.name,
  });

  factory ParamChangeInfoNotImage.fromJson(Map<String, dynamic> json) => _$ParamChangeInfoNotImageFromJson(json);
  Map<String, dynamic> toJson() => _$ParamChangeInfoNotImageToJson(this);

  List<Object?> get props => [phone,name];
}

@JsonSerializable()
class ParamChangeInfoAvatar {
  String avatar;

  ParamChangeInfoAvatar({
    required this.avatar,
  });

  factory ParamChangeInfoAvatar.fromJson(Map<String, dynamic> json) => _$ParamChangeInfoAvatarFromJson(json);
  Map<String, dynamic> toJson() => _$ParamChangeInfoAvatarToJson(this);

  List<Object?> get props => [avatar];
}
