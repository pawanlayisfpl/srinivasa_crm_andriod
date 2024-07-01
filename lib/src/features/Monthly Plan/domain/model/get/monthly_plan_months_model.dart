class MonthlyPlanMonthsModel {
  String? date;
  int? month;

  MonthlyPlanMonthsModel({this.date, this.month});

  MonthlyPlanMonthsModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['month'] = this.month;
    return data;
  }
}
