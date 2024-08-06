class ParticularSalesOrderModel {
  CustomerDetails? customerDetails;
  OrderDetails? orderDetails;
  List<ProductDetails>? productDetails;
  PaymentDetails? paymentDetails;

  ParticularSalesOrderModel({
    this.customerDetails,
    this.orderDetails,
    this.productDetails,
    this.paymentDetails,
  });

  ParticularSalesOrderModel.fromJson(Map<String, dynamic> json) {
    customerDetails = json['customerDetails'] != null
        ? CustomerDetails.fromJson(json['customerDetails'])
        : null;
    orderDetails = json['orderDetails'] != null
        ? OrderDetails.fromJson(json['orderDetails'])
        : null;
    if (json['productDetails'] != null) {
      productDetails = <ProductDetails>[];
      json['productDetails'].forEach((v) {
        productDetails!.add(ProductDetails.fromJson(v));
      });
    }
    paymentDetails = json['paymentDetails'] != null
        ? PaymentDetails.fromJson(json['paymentDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customerDetails != null) {
      data['customerDetails'] = customerDetails!.toJson();
    }
    if (orderDetails != null) {
      data['orderDetails'] = orderDetails!.toJson();
    }
    if (productDetails != null) {
      data['productDetails'] =
          productDetails!.map((v) => v.toJson()).toList();
    }
    if (paymentDetails != null) {
      data['paymentDetails'] = paymentDetails!.toJson();
    }
    return data;
  }
}

class CustomerDetails {
  String? customerName;
  String? contactPerson;
  String? city;
  String? state;
  String? customerType;
  String? phone;
  String? email;

  CustomerDetails({
    this.customerName,
    this.contactPerson,
    this.city,
    this.state,
    this.customerType,
    this.phone,
    this.email,
  });

  CustomerDetails.fromJson(Map<String, dynamic> json) {
    customerName = json['customerName'];
    contactPerson = json['contactPerson'];
    city = json['city'];
    state = json['state'];
    customerType = json['customerType'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerName'] = customerName;
    data['contactPerson'] = contactPerson;
    data['city'] = city;
    data['state'] = state;
    data['customerType'] = customerType;
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}

class OrderDetails {
  int? erpOrderID;
  String? createDate;
  String? createdBy;
  String? orderStatus;
  int? orderId;
  String? remarks;
  double? amountPaid;
  double? balanceAmount;
  String? balanceAmountDueDate;
  String? orderRemarks;

  OrderDetails({
    this.erpOrderID,
    this.createDate,
    this.createdBy,
    this.orderStatus,
    this.orderId,
    this.remarks,
    this.amountPaid,
    this.balanceAmount,
    this.balanceAmountDueDate,
    this.orderRemarks,
  });

  OrderDetails.fromJson(Map<String, dynamic> json) {
    erpOrderID = json['erpOrderID'];
    createDate = json['createDate'];
    createdBy = json['createdBy'];
    orderStatus = json['orderStatus'];
    orderId = json['orderId'];
    remarks = json['remarks'];
    amountPaid = (json['amountPaid'] as num?)?.toDouble();
    balanceAmount = (json['balanceAmount'] as num?)?.toDouble();
    balanceAmountDueDate = json['balanceAmountDueDate'];
    orderRemarks = json['orderRemarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['erpOrderID'] = erpOrderID;
    data['createDate'] = createDate;
    data['createdBy'] = createdBy;
    data['orderStatus'] = orderStatus;
    data['orderId'] = orderId;
    data['remarks'] = remarks;
    data['amountPaid'] = amountPaid;
    data['balanceAmount'] = balanceAmount;
    data['balanceAmountDueDate'] = balanceAmountDueDate;
    data['orderRemarks'] = orderRemarks;
    return data;
  }
}

class ProductDetails {
  String? divisionName;
  String? productName;
  int? quantity;
  double? rate;
  double? discountPerQuantity;
  double? getDiscountPerQuantityInPercent;
  double? totalAmount;
  dynamic gstAmount;
  double? sellingRate;
  String? uomName;
  double? quantityToDeliver;
  String? shipmentDate;
  String? ceHatchDate;

  ProductDetails({
    this.divisionName,
    this.productName,
    this.quantity,
    this.rate,
    this.discountPerQuantity,
    this.getDiscountPerQuantityInPercent,
    this.totalAmount,
    this.gstAmount,
    this.sellingRate,
    this.uomName,
    this.quantityToDeliver,
    this.shipmentDate,
    this.ceHatchDate,
  });

  ProductDetails.fromJson(Map<String, dynamic> json) {
    divisionName = json['divisionName'];
    productName = json['productName'];
    quantity = json['quantity'];
    rate = (json['rate'] as num?)?.toDouble();
    discountPerQuantity = (json['discountPerQuantity'] as num?)?.toDouble();
    getDiscountPerQuantityInPercent = (json['getDiscountPerQuantityInPercent'] as num?)?.toDouble();
    totalAmount = (json['totalAmount'] as num?)?.toDouble();
    gstAmount = (json['gstAmount'] as num?)?.toDouble();
    sellingRate = (json['sellingRate'] as num?)?.toDouble();
    uomName = json['uomName'];
    quantityToDeliver = (json['quantityToDeliver'] as num?)?.toDouble();
    shipmentDate = json['shipmentDate'];
    ceHatchDate = json['ceHatchDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['divisionName'] = divisionName;
    data['productName'] = productName;
    data['quantity'] = quantity;
    data['rate'] = rate;
    data['discountPerQuantity'] = discountPerQuantity;
    data['getDiscountPerQuantityInPercent'] = getDiscountPerQuantityInPercent;
    data['totalAmount'] = totalAmount;
    data['gstAmount'] = gstAmount;
    data['sellingRate'] = sellingRate;
    data['uomName'] = uomName;
    data['quantityToDeliver'] = quantityToDeliver;
    data['shipmentDate'] = shipmentDate;
    data['ceHatchDate'] = ceHatchDate;
    return data;
  }
}

class PaymentDetails {
  int? paymentId;
  double? totalAmount;
  double? pendingAmount;
  String? dueDate;
  String? paymentStatus;
  String? totalAmountPaid;

  PaymentDetails({
    this.paymentId,
    this.totalAmount,
    this.pendingAmount,
    this.dueDate,
    this.paymentStatus,
    this.totalAmountPaid,
  });

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    paymentId = json['paymentId'];
    totalAmount = (json['totalAmount'] as num?)?.toDouble();
    pendingAmount = (json['pendingAmount'] as num?)?.toDouble();
    dueDate = json['dueDate'];
    paymentStatus = json['paymentStatus'];
    totalAmountPaid = (json['totalAmountPaid'] as String);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentId'] = paymentId;
    data['totalAmount'] = totalAmount;
    data['pendingAmount'] = pendingAmount;
    data['dueDate'] = dueDate;
    data['paymentStatus'] = paymentStatus;
    data['totalAmountPaid'] = totalAmountPaid;
    return data;
  }
}