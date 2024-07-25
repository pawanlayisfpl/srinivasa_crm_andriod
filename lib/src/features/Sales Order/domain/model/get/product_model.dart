class ProductsModel {
  String? productName;
  int? productId;
  Division? division;

  ProductsModel({this.productName, this.productId, this.division});

  ProductsModel.fromJson(Map<String, dynamic> json) {
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
  int? divisionId;
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
