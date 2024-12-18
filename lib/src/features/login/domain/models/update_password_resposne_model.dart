
class UpdatePasswordResponseModel {
  final bool status;
  final String message;

  UpdatePasswordResponseModel({required this.status, required this.message});

  factory UpdatePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordResponseModel(
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