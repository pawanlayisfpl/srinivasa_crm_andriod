class ApprovePlanPostModel {
  final String monthlyPlanId;

  ApprovePlanPostModel({
    required this.monthlyPlanId,
  });

  Map<String, dynamic> toJson() {
    return {
      'monthlyPlanId': monthlyPlanId,
    };
  }
}