class LastPunchInResponseModel {
  String? message;
  bool? status;

  LastPunchInResponseModel({this.message, this.status});

  LastPunchInResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
