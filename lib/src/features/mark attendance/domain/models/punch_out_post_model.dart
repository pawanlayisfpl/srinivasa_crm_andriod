// class PunchoutPostModel {
//   String latitude;
//   String longitude;

//   PunchoutPostModel({
//     required this.latitude,
//     required this.longitude,
//   });

//   // Factory constructor for creating a new instance from a map
//   factory PunchoutPostModel.fromJson(Map<String, dynamic> json) {
//     return PunchoutPostModel(
//       latitude: json['latitude'],
//       longitude: json['longitude'],
//     );
//   }

//   // Method for converting an instance to a map
//   Map<String, dynamic> toJson() {
//     return {
//       'latitude': latitude,
//       'longitude': longitude,
//     };
//   }
// }


import 'package:flutter/services.dart';

class PunchoutPostModel {
  String latitude;
  String longitude;
  String createdAt;
  String? batteryStatus;
  String? punchInOutDistance;
  String? punchOutOdometerKMS;
  String? vehicleId;
 List<Uint8List>? images;

  PunchoutPostModel({
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    this.batteryStatus,
    this.punchInOutDistance,
    this.punchOutOdometerKMS,
    this.vehicleId,
    this.images
  });

  // Factory constructor for creating a new instance from a map
  factory PunchoutPostModel.fromJson(Map<String, dynamic> json) {
    return PunchoutPostModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
      createdAt: json['createdAt'],
      batteryStatus: json['batteryStatus'],
      punchInOutDistance: json['punchInOutDistance'],
      punchOutOdometerKMS: json['punchOutOdometerKMS'],
      vehicleId: json['vehicleId'],
      images: json['images'],
    );
  }

  // Method for converting an instance to a map
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'createdAt': createdAt,
      'batteryStatus': batteryStatus,
      'punchInOutDistance':punchInOutDistance,
      'punchOutOdometerKMS':punchOutOdometerKMS,
      'vehicleId':vehicleId,
      'images':images,
    };
  }
}