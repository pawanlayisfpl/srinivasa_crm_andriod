class LocalityModel {
  int? localityId;
  String? localaityName;

  LocalityModel({this.localityId, this.localaityName});

  LocalityModel.fromJson(Map<String, dynamic> json) {
    localityId = json['localityId'];
    localaityName = json['localaityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['localityId'] = localityId;
    data['localaityName'] = localaityName;
    return data;
  }
}
