
class DeliveryTypeModel {
  int? deliveryTypeId;
  String? deliveryTypeName;
  String? deliveryTypeCode;

  DeliveryTypeModel({this.deliveryTypeId, this.deliveryTypeName, this.deliveryTypeCode});

  DeliveryTypeModel.fromJson(Map<String, dynamic> json) {
    deliveryTypeId = json['deliveryTypeId'];
    deliveryTypeName = json['deliveryTypeName'];
    deliveryTypeCode = json['deliveryTypeCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deliveryTypeId'] = deliveryTypeId;
    data['deliveryTypeName'] = deliveryTypeName;
    data['deliveryTypeCode'] = deliveryTypeCode;
    return data;
  }
}
