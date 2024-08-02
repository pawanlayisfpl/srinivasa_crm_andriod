class CustomerCodeModel {
  final String customerCode;
  final String customerName;
  final String customerEmail;

  CustomerCodeModel({
    required this.customerCode,
    required this.customerName,
    required this.customerEmail,
  });

  factory CustomerCodeModel.fromJson(Map<String, dynamic> json) {
    return CustomerCodeModel(
      customerCode: json['customerCode'],
      customerName: json['customerName'],
      customerEmail: json['customerEmail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerCode': customerCode,
      'customerName': customerName,
      'customerEmail': customerEmail,
    };
  }
}