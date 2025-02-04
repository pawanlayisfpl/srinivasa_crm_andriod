class EmployeReportingManagerModel {
  List<EmployeRepModel>? body;
  bool? status;
  String? message;

  EmployeReportingManagerModel({this.body, this.status, this.message});

  EmployeReportingManagerModel.fromJson(Map<String, dynamic> json) {
    if (json['body'] != null) {
      body = <EmployeRepModel>[];
      json['body'].forEach((v) {
        body!.add(EmployeRepModel.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (body != null) {
      data['body'] = body!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class EmployeRepModel {
  int? id;
  String? userName;
  List<String>? designation;

  EmployeRepModel({this.id, this.userName, this.designation});

  EmployeRepModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    designation = json['designation'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['designation'] = designation;
    return data;
  }
}
