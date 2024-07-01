class MarkAlertAsReadPostModel {
  int? notificationId;

  MarkAlertAsReadPostModel({this.notificationId});

  MarkAlertAsReadPostModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notificationId'] = notificationId;
    return data;
  }
}
  