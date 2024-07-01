class ZoneModel {
  int? zoneId;
  String? zoneName;

  ZoneModel({this.zoneId, this.zoneName});

  ZoneModel.fromJson(Map<String, dynamic> json) {
    zoneId = json['zoneId'];
    zoneName = json['zoneName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zoneId'] = this.zoneId;
    data['zoneName'] = this.zoneName;
    return data;
  }
}
