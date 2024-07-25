class PaymentModeModel {
  int? paymentModeId;
  String? paymentModeName;

  PaymentModeModel({this.paymentModeId, this.paymentModeName});

  PaymentModeModel.fromJson(Map<String, dynamic> json) {
    paymentModeId = json['paymentModeId'];
    paymentModeName = json['paymentModeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentModeId'] = paymentModeId;
    data['paymentModeName'] = paymentModeName;
    return data;
  }
}
