class CustomerCodeModel {
  final String customerCode;
  final String customerName;
  final String customerLocation;

  CustomerCodeModel({
    required this.customerCode,
    required this.customerName,
    required this.customerLocation,
  });

  factory CustomerCodeModel.fromJson(Map<String, dynamic> json) {
    return CustomerCodeModel(
      customerCode: json['customerCode'],
      customerName: json['custName'],
      customerLocation: json['custLocation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerCode': customerCode,
      'customerName': customerName,
      'customerLocation': customerLocation,
    };
  }
}