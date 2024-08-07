class SalesOrderApproveResponseModel {
  final bool status;
  final String message;

  SalesOrderApproveResponseModel({required this.status, required this.message});

  factory SalesOrderApproveResponseModel.fromJson(Map<String, dynamic> json) {
    return SalesOrderApproveResponseModel(
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