// ignore_for_file: public_member_api_docs, sort_constructors_first
// class PunchInPostModel {
//   String? latitude;
//   String? longitude;

//   PunchInPostModel({ this.latitude, this.longitude});

//   PunchInPostModel.fromJson(Map<String, dynamic> json) {
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['latitude'] = latitude;
//     data['longitude'] = longitude;
//     return data;
//   }
// }



import 'dart:typed_data';

class PunchInPostModel {
  String? latitude;
  String? longitude;
  String? createdAt;
  String? batteryStatus;
  String? punchInOdometerKMS;
  String? punchOutOdometerKMS;
  String? vehicleId;
  List<Uint8List>? images;

  PunchInPostModel({
    this.latitude,
    this.longitude,
    this.createdAt,
    this.batteryStatus,
    this.punchInOdometerKMS,
    this.punchOutOdometerKMS,
    this.vehicleId,
    this.images,
  });

  PunchInPostModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['createdAt'];
    batteryStatus = json['batteryStatus'];
    punchInOdometerKMS = json['punchInOdometerKMS'];
    punchOutOdometerKMS = json['punchOutOdometerKMS'];
    vehicleId = json['vehicleId'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['createdAt'] = createdAt;
    data["batteryStatus"] = batteryStatus;
    data['punchInOdometerKMS']=punchInOdometerKMS;
    data['punchOutOdometerKMS'] = punchOutOdometerKMS;
    data['vehicleId']=vehicleId;
    data['images'] = images;
    return data;
  }
}
