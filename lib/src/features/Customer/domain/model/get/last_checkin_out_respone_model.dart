class LastCheckinOutResponseModel {
  String? time;
  String? customerCode;
  List<int>? users;
  bool? status;
  String? message;

  LastCheckinOutResponseModel(
      {this.time, this.customerCode, this.users, this.status, this.message});

  LastCheckinOutResponseModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    customerCode = json['customerCode'];
    users = json['users'].cast<int>();
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['customerCode'] = customerCode;
    data['users'] = users;
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
