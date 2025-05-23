class MonthlyPlanRejectResponseModel {
  bool? status;
  String? message;

  MonthlyPlanRejectResponseModel({this.status, this.message});

  MonthlyPlanRejectResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
