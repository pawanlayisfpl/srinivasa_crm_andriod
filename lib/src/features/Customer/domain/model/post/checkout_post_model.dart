// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

class CheckoutPostModel {
  List<Uint8List>? images;
  List<Uint8List>? files;
  List<int> userIds;
  String? purposeId;
  String? customerName;
  String? langitude;
  String? latitude;
  String? remarks;
  String? farmId;
  String? customerId;


  CheckoutPostModel({
    this.images,
    this.files,
    required this.userIds,
    this.purposeId,
    this.customerName,
    this.langitude,
    this.latitude,
    this.remarks,
    this.farmId,
    this.customerId,
  });

  Map<String, dynamic> toJson() {
    return {
      'images': images?.map((e) => e.toList()).toList(),
      'pdfs': files?.map((e) => e.toList()).toList(),
      'customerName': customerName,
      'langitude': langitude,
      'latitude': latitude,
      'remarks': remarks,
      "purposeId" : purposeId,
      "userIds": userIds,
      "farmId": farmId,
      "customerId": customerId,

    };
  }
}
