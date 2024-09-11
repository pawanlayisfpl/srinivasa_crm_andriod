class MonthlyPlanMonthsModel {
  String? date;
  int? month;
  int? monthlyPlanId;

  MonthlyPlanMonthsModel({this.date, this.month,this.monthlyPlanId});

  MonthlyPlanMonthsModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    month = json['month'];
    monthlyPlanId = json['monthlyPlanId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['month'] = month;
    data['monthlyPlanId'] = monthlyPlanId;
    return data;
  }
}
