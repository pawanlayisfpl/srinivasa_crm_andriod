class CustomerKycModel {
  String? customerId;
  String? customerName;
  String? kycStatus;

  CustomerKycModel({this.customerId, this.customerName, this.kycStatus});

  CustomerKycModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerName = json['customerName'];
    kycStatus = json['kycStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerId'] = customerId;
    data['customerName'] = customerName;
    data['kycStatus'] = kycStatus;
    return data;
  }
}
