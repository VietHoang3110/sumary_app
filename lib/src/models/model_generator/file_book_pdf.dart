import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'file_book_pdf.g.dart';



@JsonSerializable()
class FileBookPdfResponse extends BaseResponse {
  final String data;


  FileBookPdfResponse(this.data);


  factory FileBookPdfResponse.fromJson(Map<String, dynamic> json) => _$FileBookPdfResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FileBookPdfResponseToJson(this);
}

