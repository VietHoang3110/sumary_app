

class CheckChapterDone {
  int? statusCode;
  String? message;
  DataChapterDone? data;

  CheckChapterDone({this.statusCode, this.message, this.data});

  CheckChapterDone.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new DataChapterDone.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataChapterDone {
  String? massage;

  DataChapterDone({this.massage});

  DataChapterDone.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massage'] = this.massage;
    return data;
  }
}
