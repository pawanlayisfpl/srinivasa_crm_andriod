class PendingOrdersModel {
  List<Orders>? orders;

  PendingOrdersModel({this.orders});

  PendingOrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
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
        ? new CustomerDetails.fromJson(json['customerDetails'])
        : null;
    orderId = json['orderId'];
    orderDate = json['orderDate'];
    orderCreator = json['orderCreator'];
    orderStatus = json['orderStatus'];
    if (json['productDetails'] != null) {
      productDetails = <ProductDetails>[];
      json['productDetails'].forEach((v) {
        productDetails!.add(new ProductDetails.fromJson(v));
      });
    }
    erporderId = json['erporderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerDetails != null) {
      data['customerDetails'] = this.customerDetails!.toJson();
    }
    data['orderId'] = this.orderId;
    data['orderDate'] = this.orderDate;
    data['orderCreator'] = this.orderCreator;
    data['orderStatus'] = this.orderStatus;
    if (this.productDetails != null) {
      data['productDetails'] =
          this.productDetails!.map((v) => v.toJson()).toList();
    }
    data['erporderId'] = this.erporderId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['custName'] = this.custName;
    data['custPhone'] = this.custPhone;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['productId'] = this.productId;
    data['division'] = this.division;
    return data;
  }
}
