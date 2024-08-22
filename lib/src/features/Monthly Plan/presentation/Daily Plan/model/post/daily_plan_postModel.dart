class DailyPlanCreateModel {
  int monthlyPlanId;
  DailyPlan dailyPlan;
  bool confirmed;

  DailyPlanCreateModel({
    required this.monthlyPlanId,
    required this.dailyPlan,
    required this.confirmed,
  });

  factory DailyPlanCreateModel.fromJson(Map<String, dynamic> json) {
    return DailyPlanCreateModel(
      monthlyPlanId: json['monthlyPlanId'],
      dailyPlan: DailyPlan.fromJson(json['dailyPlan']),
      confirmed: json['confirmed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'monthlyPlanId': monthlyPlanId,
      'dailyPlan': dailyPlan.toJson(),
      'confirmed': confirmed,
    };
  }
}

class DailyPlan {
  String createdDate;
  double approxKms;
  List<String> customerCodes;

  DailyPlan({
    required this.createdDate,
    required this.approxKms,
    required this.customerCodes,
  });

  factory DailyPlan.fromJson(Map<String, dynamic> json) {
    return DailyPlan(
      createdDate: json['createdDate'],
      approxKms: json['approxKms'],
      customerCodes: List<String>.from(json['farmIds']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdDate': createdDate,
      'approxKms': approxKms,
      'farmIds': customerCodes,
    };
  }
}