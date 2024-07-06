class UpdateMonthlyPlanResponseModel {
  final String message;

  UpdateMonthlyPlanResponseModel({required this.message});

  factory UpdateMonthlyPlanResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateMonthlyPlanResponseModel(
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}