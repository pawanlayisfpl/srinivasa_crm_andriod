class PaymentDetailsModel {
  final DateTime dueDate;
  final double amount;
  final int dueAmountPercentage;

  PaymentDetailsModel({
    required this.dueDate,
    required this.amount,
    required this.dueAmountPercentage,
  });

  factory PaymentDetailsModel.fromJson(Map<String, dynamic> json) {
    return PaymentDetailsModel(
      dueDate: DateTime.parse(json['dueDate']),
      amount: json['amount'],
      dueAmountPercentage: json['dueAmountPercentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dueDate': dueDate.toIso8601String(),
      'amount': amount,
      'dueAmountPercentage': dueAmountPercentage,
    };
  }
}