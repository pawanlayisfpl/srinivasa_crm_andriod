class DistrictModel {
  String? districtId;
  String? districtName;

  DistrictModel({this.districtId, this.districtName});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    districtId = json['districtId'];
    districtName = json['districtName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['districtId'] = districtId;
    data['districtName'] = districtName;
    return data;
  }
}
