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

class PunchInPostModel {
  String? latitude;
  String? longitude;
  String? createdAt;

  PunchInPostModel({this.latitude, this.longitude, this.createdAt});

  PunchInPostModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['createdAt'] = createdAt;
    return data;
  }
}
