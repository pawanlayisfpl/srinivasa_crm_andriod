class ViewSalesOrderModel {
  List<Orders>? orders;

  ViewSalesOrderModel({this.orders});

  ViewSalesOrderModel.fromJson(Map<String, dynamic> json) {
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
  String? orderId;
  String? eRPOrderId;
  String? orderDate;
  String? orderCreator;
  String? orderStatus;
  List<ProductDetails>? productDetails;

  Orders(
      {this.customerDetails,
      this.orderId,
      this.eRPOrderId,
      this.orderDate,
      this.orderCreator,
      this.orderStatus,
      this.productDetails});

  Orders.fromJson(Map<String, dynamic> json) {
    customerDetails = json['customerDetails'] != null
        ? CustomerDetails.fromJson(json['customerDetails'])
        : null;
    orderId = json['orderId'];
    eRPOrderId = json['ERPOrderId'];
    orderDate = json['orderDate'];
    orderCreator = json['orderCreator'];
    orderStatus = json['orderStatus'];
    if (json['productDetails'] != null) {
      productDetails = <ProductDetails>[];
      json['productDetails'].forEach((v) {
        productDetails!.add(ProductDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customerDetails != null) {
      data['customerDetails'] = customerDetails!.toJson();
    }
    data['orderId'] = orderId;
    data['ERPOrderId'] = eRPOrderId;
    data['orderDate'] = orderDate;
    data['orderCreator'] = orderCreator;
    data['orderStatus'] = orderStatus;
    if (productDetails != null) {
      data['productDetails'] =
          productDetails!.map((v) => v.toJson()).toList();
    }
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
  Division? division;

  ProductDetails({this.productName, this.productId, this.division});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    productId = json['productId'];
    division = json['division'] != null
        ? Division.fromJson(json['division'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productName'] = productName;
    data['productId'] = productId;
    if (division != null) {
      data['division'] = division!.toJson();
    }
    return data;
  }
}

class Division {
  String? divisionId;
  String? divisionName;

  Division({this.divisionId, this.divisionName});

  Division.fromJson(Map<String, dynamic> json) {
    divisionId = json['divisionId'];
    divisionName = json['divisionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['divisionId'] = divisionId;
    data['divisionName'] = divisionName;
    return data;
  }
}
