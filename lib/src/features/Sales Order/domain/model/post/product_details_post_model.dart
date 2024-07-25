class ProductDetailsPostModel {
  final int divisionId;
  final int productId;
  final int quantity;
  final double rate;
  final double discountPerQuantity;
  final double getDiscountPerQuantityInPercent;
  final double totalAmount;
  final double gstAmount;
  final double sellingRate;
  final int uomId;
  final int quantityToDeliver;
  final DateTime shipmentDate;
  final DateTime ceHatchDate;

  ProductDetailsPostModel({
    required this.divisionId,
    required this.productId,
    required this.quantity,
    required this.rate,
    required this.discountPerQuantity,
    required this.getDiscountPerQuantityInPercent,
    required this.totalAmount,
    required this.gstAmount,
    required this.sellingRate,
    required this.uomId,
    required this.quantityToDeliver,
    required this.shipmentDate,
    required this.ceHatchDate,
  });

  factory ProductDetailsPostModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsPostModel(
      divisionId: json['divisionId'],
      productId: json['productId'],
      quantity: json['quantity'],
      rate: json['rate'],
      discountPerQuantity: json['discountPerQuantity'],
      getDiscountPerQuantityInPercent: json['getDiscountPerQuantityInPercent'],
      totalAmount: json['totalAmount'],
      gstAmount: json['gstAmount'],
      sellingRate: json['sellingRate'],
      uomId: json['uomId'],
      quantityToDeliver: json['quantityToDeliver'],
      shipmentDate: DateTime.parse(json['shipmentDate']),
      ceHatchDate: DateTime.parse(json['ceHatchDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'divisionId': divisionId,
      'productId': productId,
      'quantity': quantity,
      'rate': rate,
      'discountPerQuantity': discountPerQuantity,
      'getDiscountPerQuantityInPercent': getDiscountPerQuantityInPercent,
      'totalAmount': totalAmount,
      'gstAmount': gstAmount,
      'sellingRate': sellingRate,
      'uomId': uomId,
      'quantityToDeliver': quantityToDeliver,
      'shipmentDate': shipmentDate.toIso8601String(),
      'ceHatchDate': ceHatchDate.toIso8601String(),
    };
  }
}