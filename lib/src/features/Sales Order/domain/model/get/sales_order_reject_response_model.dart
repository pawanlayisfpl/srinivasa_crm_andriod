class SalesOrderRejectResponseModel {
  final bool status;
  final String message;

  SalesOrderRejectResponseModel({required this.status, required this.message});

  factory SalesOrderRejectResponseModel.fromJson(Map<String, dynamic> json) {
    return SalesOrderRejectResponseModel(
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