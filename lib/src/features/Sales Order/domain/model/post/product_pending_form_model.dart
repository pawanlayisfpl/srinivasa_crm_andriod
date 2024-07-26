// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductPendingFormModel {
  final String id;
  final String dueDate;
  final double dueAmount;
  final double? dueAmountPercentage;

  ProductPendingFormModel({
    required this.id,
    required this.dueDate,
    required this.dueAmount,
    this.dueAmountPercentage,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dueDate': dueDate,
      'dueAmount': dueAmount,
      'dueAmountPercentage': dueAmountPercentage,
    };
  }
}
