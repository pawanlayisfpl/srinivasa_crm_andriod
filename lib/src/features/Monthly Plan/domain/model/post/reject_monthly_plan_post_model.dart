class RejectMonthlyPlanPostModel {
  final String monthlyPlanId;
  final String comments;

  RejectMonthlyPlanPostModel({
    required this.monthlyPlanId,
    required this.comments,
  });

  Map<String, dynamic> toJson() {
    return {
      'monthlyPlanId': monthlyPlanId,
      'comments': comments,
    };
  }
}