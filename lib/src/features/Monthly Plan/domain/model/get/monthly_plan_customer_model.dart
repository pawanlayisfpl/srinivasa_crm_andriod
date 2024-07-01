class MonthlyPlanCustomerModel {
  String? customerCode;
  String? customerName;
  String? customerAddress;
  String? customerCity;
  String? customerContactNumber;
  String? customerAlternateContactNumber;
  String? customerState;
  String? customerEmail;
  String? customerCategory;
  String? status;
  String? checkinLocation;
  String? checkoutLocation;

  MonthlyPlanCustomerModel(
      {this.customerCode,
      this.customerName,
      this.customerAddress,
      this.customerCity,
      this.customerContactNumber,
      this.customerAlternateContactNumber,
      this.customerState,
      this.customerEmail,
      this.customerCategory,
      this.status,
      this.checkinLocation,
      this.checkoutLocation});

  MonthlyPlanCustomerModel.fromJson(Map<String, dynamic> json) {
    customerCode = json['customerCode'];
    customerName = json['customerName'];
    customerAddress = json['customerAddress'];
    customerCity = json['customerCity'];
    customerContactNumber = json['customerContactNumber'];
    customerAlternateContactNumber = json['customerAlternateContactNumber'];
    customerState = json['customerState'];
    customerEmail = json['customerEmail'];
    customerCategory = json['customerCategory'];
    status = json['status'];
    checkinLocation = json['checkinLocation'];
    checkoutLocation = json['checkoutLocation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerCode'] = customerCode;
    data['customerName'] = customerName;
    data['customerAddress'] = customerAddress;
    data['customerCity'] = customerCity;
    data['customerContactNumber'] = customerContactNumber;
    data["customerAlternateContactNumber"] =
        customerAlternateContactNumber;
    data['customerState'] = customerState;
    data['customerEmail'] = customerEmail;
    data['customerCategory'] = customerCategory;
    data['status'] = status;
    data['checkinLocation'] = checkinLocation;
    data['checkoutLocation'] = checkoutLocation;
    return data;
  }
}
