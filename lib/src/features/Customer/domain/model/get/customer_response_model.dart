
import 'customer_model.dart';

class CustomerResponseModel {
  List<Customermodel>? customermodel;

  CustomerResponseModel({this.customermodel,});

  CustomerResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['customers'] != null) {
      customermodel = <Customermodel>[];
      json['customers'].forEach((v) {
        customermodel!.add(Customermodel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customermodel != null) {
      data['customers'] =
          customermodel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
