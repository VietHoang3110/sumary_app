
import 'package:json_annotation/json_annotation.dart';
import 'package:sumary_app/src/models/model_generator/base_response.dart';

part 'list_notification.g.dart';

@JsonSerializable()
class DataNotification {
  @JsonKey(name: "_id")
  final String id;
  final String? title;
  final String? content;
  final String? description;
  final bool? isRead;
  final bool? isActivated;
  final String? author;
  final String? createdAt;
  @JsonKey(name: "__v")
  final int? v;





  DataNotification(this.id, this.title, this.content, this.description, this.isRead, this.isActivated, this.author, this.createdAt, this.v);

  factory DataNotification.fromJson(Map<String, dynamic> json) => _$DataNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$DataNotificationToJson(this);
}

@JsonSerializable()
class ListNotification {
  final int? total;
  final int? currentPage;
  final int? pageSize;
  List<DataNotification>? records;


  ListNotification(this.total, this.currentPage, this.pageSize, this.records);

  factory ListNotification.fromJson(Map<String, dynamic> json) => _$ListNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$ListNotificationToJson(this);
}

@JsonSerializable()
class ListNotificationResponse extends BaseResponse{
  final ListNotification? data;


  ListNotificationResponse(this.data);

  factory ListNotificationResponse.fromJson(Map<String, dynamic> json) => _$ListNotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListNotificationResponseToJson(this);
}


