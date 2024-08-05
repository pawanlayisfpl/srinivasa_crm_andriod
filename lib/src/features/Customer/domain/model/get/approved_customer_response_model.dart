class ApprovedCustomerModel {
  String? custName;
  String? customerCode;
  String? custLocation;

  ApprovedCustomerModel({this.custName, this.customerCode, this.custLocation});

  ApprovedCustomerModel.fromJson(Map<String, dynamic> json) {
    custName = json['custName'];
    customerCode = json['customerCode'];
    custLocation = json['custLocation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['custName'] = this.custName;
    data['customerCode'] = this.customerCode;
    data['custLocation'] = this.custLocation;
    return data;
  }
}
