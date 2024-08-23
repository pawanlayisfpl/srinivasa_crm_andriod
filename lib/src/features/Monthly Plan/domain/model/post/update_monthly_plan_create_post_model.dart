class MonthlyPlanPostModel {
  String monthlyPlanId;
  List<DailyPlan> dailyPlans;

  MonthlyPlanPostModel({
    required this.monthlyPlanId,
    required this.dailyPlans,
  });

  factory MonthlyPlanPostModel.fromJson(Map<String, dynamic> json) {
    return MonthlyPlanPostModel(
      monthlyPlanId: json['monthlyPlanId'],
      dailyPlans: (json['dailyPlans'] as List)
          .map((i) => DailyPlan.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'monthlyPlanId': monthlyPlanId,
      'dailyPlans': dailyPlans.map((i) => i.toJson()).toList(),
    };
  }
}

class DailyPlan {
  int? dailyPlanId;
  String createdDate;
  int approxKms;
  List<String> farmids;

  DailyPlan({
    this.dailyPlanId,
    required this.createdDate,
    required this.approxKms,
    required this.farmids,
  });

  factory DailyPlan.fromJson(Map<String, dynamic> json) {
    return DailyPlan(
      dailyPlanId: json['dailyPlanId'],
      createdDate: json['createdDate'],
      approxKms: json['approxKms'],
      farmids: List<String>.from(json['farmids']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dailyPlanId': dailyPlanId,
      'createdDate': createdDate,
      'approxKms': approxKms,
      'farmids': farmids,
    };
  }
}