class DeleteMonthlyPlanResponseModel {
  final bool status;
  final String message;

  DeleteMonthlyPlanResponseModel({
    required this.status,
    required this.message,
  });

  factory DeleteMonthlyPlanResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteMonthlyPlanResponseModel(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}