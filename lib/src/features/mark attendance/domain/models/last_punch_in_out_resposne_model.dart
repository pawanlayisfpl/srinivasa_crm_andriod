class LastPunchInResponseModel {
  String? message;
  bool? status;
  PunchInData? data;

  LastPunchInResponseModel({this.message, this.status, this.data});

  LastPunchInResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? PunchInData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    dataMap['message'] = message;
    dataMap['status'] = status;
    if (data != null) {
      dataMap['data'] = data!.toJson();
    }
    return dataMap;
  }
}

class PunchInData {
  int? vehicleId;
  int? punchInOdoKMS;

  PunchInData({this.vehicleId, this.punchInOdoKMS});

  PunchInData.fromJson(Map<String, dynamic> json) {
    vehicleId = json['vehicleId'];
    punchInOdoKMS = json['punchInOdoKMS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    dataMap['vehicleId'] = vehicleId;
    dataMap['punchInOdoKMS'] = punchInOdoKMS;
    return dataMap;
  }
}
