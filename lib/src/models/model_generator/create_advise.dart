
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'create_advise.g.dart';


@JsonSerializable()
class CreateAdvise {

  final String name;
  final String issueType;
  final String appointmentDate;
  final int phoneNumber;
  final String email;
  final String content;
  final String note;

  CreateAdvise({
    required this.name,
    required this.issueType,
    required this.appointmentDate,
    required this.phoneNumber,
    required this.email,
    required this.content,
    required this.note,
  });

  factory CreateAdvise.fromJson(Map<String, dynamic> json) => _$CreateAdviseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateAdviseToJson(this);
}


@JsonSerializable()
class CreateAdviseResponse  extends BaseResponse{

  CreateAdviseResponse? data;

  CreateAdviseResponse(this.data);

  factory CreateAdviseResponse.fromJson(Map<String, dynamic> json) => _$CreateAdviseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAdviseResponseToJson(this);
}
