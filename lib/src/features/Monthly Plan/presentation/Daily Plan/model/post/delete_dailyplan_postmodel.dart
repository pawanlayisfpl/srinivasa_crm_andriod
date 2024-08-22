class DailyplanDeletePostModel {
  String monthlyPlanId;
  String dailyPlanId;

  DailyplanDeletePostModel({
    required this.monthlyPlanId,
    required this.dailyPlanId,
  });

  factory DailyplanDeletePostModel.fromJson(Map<String, dynamic> json) {
    return DailyplanDeletePostModel(
      monthlyPlanId: json['monthlyPlanId'],
      dailyPlanId: json['dailyPlanId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'monthlyPlanId': monthlyPlanId,
      'dailyPlanId': dailyPlanId,
    };
  }
}