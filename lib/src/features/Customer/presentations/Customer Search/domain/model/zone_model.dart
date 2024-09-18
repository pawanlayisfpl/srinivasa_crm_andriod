class ZoneModel {
  int? zoneId;
  String? zoneName;

  ZoneModel({this.zoneId, this.zoneName});

  ZoneModel.fromJson(Map<String, dynamic> json) {
    zoneId = json['zoneId'];
    zoneName = json['zoneName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zoneId'] = zoneId;
    data['zoneName'] = zoneName;
    return data;
  }
}
