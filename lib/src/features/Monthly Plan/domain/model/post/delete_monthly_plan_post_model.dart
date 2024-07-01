class DeletePlanPostModel {
  final String monthlyPlanId;

  DeletePlanPostModel({
    required this.monthlyPlanId,
  });

  Map<String, dynamic> toJson() {
    return {
      'monthlyPlanId': monthlyPlanId,
    };
  }
}