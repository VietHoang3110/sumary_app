import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/index.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'update_file.g.dart';

@JsonSerializable()
class DataFile {

  final String? fileId;
  final String? fullUrl;

  DataFile(
    this.fileId,this.fullUrl
  );

  factory DataFile.fromJson(Map<String, dynamic> json) => _$DataFileFromJson(json);

  Map<String, dynamic> toJson() => _$DataFileToJson(this);
}

@JsonSerializable()
class DataFileUpdate extends BaseResponse{
  final DataFile? data;


  DataFileUpdate(
    this.data,
  );

  factory DataFileUpdate.fromJson(Map<String, dynamic> json) => _$DataFileUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$DataFileUpdateToJson(this);
}