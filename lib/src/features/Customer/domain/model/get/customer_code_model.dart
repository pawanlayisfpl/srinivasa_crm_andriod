class CustomerCodeModel {
  final String? customerCode;
  final String? customerName;
  final String? customerLocation;
  final String? customerId;

  CustomerCodeModel({
    this.customerCode,
    this.customerName,
    this.customerLocation,
    this.customerId,
  });

  factory CustomerCodeModel.fromJson(Map<String, dynamic> json) {
    return CustomerCodeModel(
      customerCode: json['customerCode'] as String?,
      customerName: json['custName'] as String?,
      customerLocation: json['custLocation'] as String?,
      customerId: json['customerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerCode': customerCode,
      'customerName': customerName,
      'customerLocation': customerLocation,
      'customerId': customerId,
    };
  }
}