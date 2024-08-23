class UpdateMonthlyDailyPlanPostModel {
  int? dailyPlanId;
  DateTime createdDate;
  double approxKms;
  List<String> customerCodes;

  UpdateMonthlyDailyPlanPostModel({
    this.dailyPlanId,
    required this.createdDate,
    required this.approxKms,
    required this.customerCodes,
  });

  factory UpdateMonthlyDailyPlanPostModel.fromJson(Map<String, dynamic> json) {
    return UpdateMonthlyDailyPlanPostModel(
      dailyPlanId: json['dailyPlanId'],
      createdDate: DateTime.parse(json['createdDate']),
      approxKms: json['approxKms'].toDouble(),
      customerCodes: List<String>.from(json['customerCodes']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dailyPlanId': dailyPlanId,
      'createdDate': createdDate.toIso8601String(),
      'approxKms': approxKms,
      'customerCodes': customerCodes,
    };
  }
}