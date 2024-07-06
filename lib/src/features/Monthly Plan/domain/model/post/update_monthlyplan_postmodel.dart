class UpdateMonthlyPlanPostModel {
  final String monthlyPlanId;
  final List<DailyPlan> dailyPlans;

  UpdateMonthlyPlanPostModel({
    required this.monthlyPlanId,
    required this.dailyPlans,
  });

  Map<String, dynamic> toJson() {
    return {
      'monthlyPlanId': monthlyPlanId,
      'dailyPlans': dailyPlans.map((dailyPlan) => dailyPlan.toJson()).toList(),
    };
  }
}

class DailyPlan {
  final DateTime createdDate;
  final double approxKms;
  final List<String> customerCodes;
  final int? dailyPlanId;

  DailyPlan({
    required this.createdDate,
    required this.approxKms,
    required this.customerCodes,
    this.dailyPlanId,
  });

  Map<String, dynamic> toJson() {
    return {
      'createdDate': createdDate.toIso8601String(),
      'approxKms': approxKms,
      'customerCodes': customerCodes,
      'dailyPlanId': dailyPlanId,
    };
  }
}
