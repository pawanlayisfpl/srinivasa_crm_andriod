class EmployeReportingManagerModel {
  List<EmployeRepModel>? body;
  bool? status;
  String? message;

  EmployeReportingManagerModel({this.body, this.status, this.message});

  EmployeReportingManagerModel.fromJson(Map<String, dynamic> json) {
    if (json['body'] != null) {
      body = <EmployeRepModel>[];
      json['body'].forEach((v) {
        body!.add(new EmployeRepModel.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['designation'] = this.designation;
    return data;
  }
}
