class PendingOrdersModel {
  List<Orders>? orders;

  PendingOrdersModel({this.orders});

  PendingOrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  CustomerDetails? customerDetails;
  int? orderId;
  String? orderDate;
  String? orderCreator;
  String? orderStatus;
  List<ProductDetails>? productDetails;
  int? erporderId;

  Orders(
      {this.customerDetails,
      this.orderId,
      this.orderDate,
      this.orderCreator,
      this.orderStatus,
      this.productDetails,
      this.erporderId});

  Orders.fromJson(Map<String, dynamic> json) {
    customerDetails = json['customerDetails'] != null
        ? CustomerDetails.fromJson(json['customerDetails'])
        : null;
    orderId = json['orderId'];
    orderDate = json['orderDate'];
    orderCreator = json['orderCreator'];
    orderStatus = json['orderStatus'];
    if (json['productDetails'] != null) {
      productDetails = <ProductDetails>[];
      json['productDetails'].forEach((v) {
        productDetails!.add(ProductDetails.fromJson(v));
      });
    }
    erporderId = json['erporderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customerDetails != null) {
      data['customerDetails'] = customerDetails!.toJson();
    }
    data['orderId'] = orderId;
    data['orderDate'] = orderDate;
    data['orderCreator'] = orderCreator;
    data['orderStatus'] = orderStatus;
    if (productDetails != null) {
      data['productDetails'] =
          productDetails!.map((v) => v.toJson()).toList();
    }
    data['erporderId'] = erporderId;
    return data;
  }
}

class CustomerDetails {
  String? customerId;
  String? custName;
  String? custPhone;

  CustomerDetails({this.customerId, this.custName, this.custPhone});

  CustomerDetails.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    custName = json['custName'];
    custPhone = json['custPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerId'] = customerId;
    data['custName'] = custName;
    data['custPhone'] = custPhone;
    return data;
  }
}

class ProductDetails {
  String? productName;
  String? productId;
  int? division;

  ProductDetails({this.productName, this.productId, this.division});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    productId = json['productId'];
    division = json['division'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productName'] = productName;
    data['productId'] = productId;
    data['division'] = division;
    return data;
  }
}
