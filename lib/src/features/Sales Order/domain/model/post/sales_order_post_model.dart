class SaleOrderPostModel {
  final String customerCode;
  final List<ProductDetail> productDetails;
  final double orderAmount;
  final double orderGstAmount;
  final double orderTotalAmount;
  final double orderDiscountAmount;
  final double amountPaid;
  final int paymentModeId;
  final double balanceAmount;
  final String balanceAmountDueDate;
  final String orderRemarks;
  final int assignTo;
  final String assignToRemarks;
  final List<PendingPaymentDetail> pendingPaymentDetails;

  SaleOrderPostModel({
    required this.customerCode,
    required this.productDetails,
    required this.orderAmount,
    required this.orderGstAmount,
    required this.orderTotalAmount,
    required this.orderDiscountAmount,
    required this.amountPaid,
    required this.paymentModeId,
    required this.balanceAmount,
    required this.balanceAmountDueDate,
    required this.orderRemarks,
    required this.assignTo,
    required this.assignToRemarks,
    required this.pendingPaymentDetails,
  });

  Map<String, dynamic> toJson() {
    return {
      'customerCode': customerCode,
      'productDetails': productDetails.map((x) => x.toJson()).toList(),
      'orderAmount': orderAmount,
      'orderGstAmount': orderGstAmount,
      'orderTotalAmount': orderTotalAmount,
      'orderDiscountAmount': orderDiscountAmount,
      'amountPaid': amountPaid,
      'paymentModeId': paymentModeId,
      'balanceAmount': balanceAmount,
      'balanceAmountDueDate': balanceAmountDueDate,
      'orderRemarks': orderRemarks,
      'assignTo': assignTo,
      'assignToRemarks': assignToRemarks,
      'pendingPaymentDetails': pendingPaymentDetails.map((x) => x.toJson()).toList(),
    };
  }
}

class ProductDetail {
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
  final String shipmentDate;
  final String ceHatchDate;

  ProductDetail({
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
      'shipmentDate': shipmentDate,
      'ceHatchDate': ceHatchDate,
    };
  }
}

class PendingPaymentDetail {
  final String dueDate;
  final double amount;
  final int dueAmountPercentage;

  PendingPaymentDetail({
    required this.dueDate,
    required this.amount,
    required this.dueAmountPercentage,
  });

  Map<String, dynamic> toJson() {
    return {
      'dueDate': dueDate,
      'amount': amount,
      'dueAmountPercentage': dueAmountPercentage,
    };
  }
}