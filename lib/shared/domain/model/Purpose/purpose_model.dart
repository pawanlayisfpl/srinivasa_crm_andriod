class PurposeModel {
  int? purposeId;
  String? purposeName;

  PurposeModel({this.purposeId, this.purposeName});

  PurposeModel.fromJson(Map<String, dynamic> json) {
    purposeId = json['purposeId'];
    purposeName = json['purposeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['purposeId'] = purposeId;
    data['purposeName'] = purposeName;
    return data;
  }
}
