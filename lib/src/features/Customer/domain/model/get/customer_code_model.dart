class CustomerCodeModel {
  final String customerCode;
  final String customerName;
  final String customerLocation;
  final String customerId;

  CustomerCodeModel({
    required this.customerCode,
    required this.customerName,
    required this.customerLocation,
    required this.customerId,
  });

  factory CustomerCodeModel.fromJson(Map<String, dynamic> json) {
    return CustomerCodeModel(
      customerCode: json['customerCode'],
      customerName: json['custName'],
      customerLocation: json['custLocation'],
      customerId: json['customerId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerCode': customerCode,
      'customerName': customerName,
      'customerLocation': customerLocation,
      "customerId" : customerId,
    };
  }
}