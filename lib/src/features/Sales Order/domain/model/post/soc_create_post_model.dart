class SocCreatePostModel {
  String customerCode;
  List<ProductDetails> productDetails;
  double orderAmount;
  double orderGstAmount;
  double orderTotalAmount;
  double orderDiscountAmount;
  double amountPaid;
  int paymentModeId;
  double balanceAmount;
  String balanceAmountDueDate;
  String orderRemarks;
  int assignTo;
  String assignToRemarks;
  List<PendingPaymentDetails> pendingPaymentDetails;

  SocCreatePostModel({
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

  factory SocCreatePostModel.fromJson(Map<String, dynamic> json) {
    return SocCreatePostModel(
      customerCode: json['customerId'],
      productDetails: List<ProductDetails>.from(json['productDetails'].map((x) => ProductDetails.fromJson(x))),
      orderAmount: json['orderAmount'],
      orderGstAmount: json['orderGstAmount'],
      orderTotalAmount: json['orderTotalAmount'],
      orderDiscountAmount: json['orderDiscountAmount'],
      amountPaid: json['amountPaid'],
      paymentModeId: json['paymentModeId'],
      balanceAmount: json['balanceAmount'],
      balanceAmountDueDate: json['balanceAmountDueDate'],
      orderRemarks: json['orderRemarks'],
      assignTo: json['assignTo'],
      assignToRemarks: json['assignToRemarks'],
      pendingPaymentDetails: List<PendingPaymentDetails>.from(json['pendingPaymentDetails'].map((x) => PendingPaymentDetails.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerCode.toString(),
      'productDetails': List<dynamic>.from(productDetails.map((x) => x.toJson())),
      'orderAmount': orderAmount,
      'orderGstAmount': orderGstAmount,
      'orderTotalAmount': orderTotalAmount,
      'orderDiscountAmount': orderDiscountAmount,
      'amountPaid': amountPaid,
      'paymentModeId': paymentModeId,
      'balanceAmount': balanceAmount,
      'balanceAmountDueDate': balanceAmountDueDate.isEmpty || !balanceAmountDueDate.contains('-') ? "" : balanceAmountDueDate,
      'orderRemarks': orderRemarks,
      'assignTo': assignTo,
      'assignToRemarks': assignToRemarks,
      'pendingPaymentDetails': List<dynamic>.from(pendingPaymentDetails.map((x) => x.toJson())),
    };
  }
}

class ProductDetails {
  int divisionId;
  int productId;
  int quantity;
  double rate;
  double discountPerQuantity;
  double getDiscountPerQuantityInPercent;
  double totalAmount;
  double gstAmount;
  double sellingRate;
  int uomId;
  int quantityToDeliver;
  String shipmentDate;
  String ceHatchDate;

  ProductDetails({
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

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
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
      shipmentDate: json['shipmentDate'],
      ceHatchDate: json['ceHatchDate'],
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
      'shipmentDate': shipmentDate,
      'ceHatchDate': ceHatchDate,
    };
  }
}

class PendingPaymentDetails {
  String dueDate;
  double amount;
  double dueAmountPercentage;

  PendingPaymentDetails({
    required this.dueDate,
    required this.amount,
    required this.dueAmountPercentage,
  });

  factory PendingPaymentDetails.fromJson(Map<String, dynamic> json) {
    return PendingPaymentDetails(
      dueDate: json['dueDate'],
      amount: json['amount'],
      dueAmountPercentage: json['dueAmountPercentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dueDate': dueDate,
      'amount': amount,
      'dueAmountPercentage': dueAmountPercentage,
    };
  }
}