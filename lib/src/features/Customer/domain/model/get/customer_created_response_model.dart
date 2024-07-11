class CustomerCreatedResponseModel {
  final bool status;
  final String message;

  CustomerCreatedResponseModel({
    required this.status,
    required this.message,
  });

  factory CustomerCreatedResponseModel.fromJson(Map<String, dynamic> json) {
    return CustomerCreatedResponseModel(
      status: json['status'],
      message: json['message'],
    );
  }
}