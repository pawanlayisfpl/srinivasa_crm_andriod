class UOMModel {
  final int uomId;
  final String uomName;

  UOMModel({required this.uomId, required this.uomName});

  factory UOMModel.fromJson(Map<String, dynamic> json) {
    return UOMModel(
      uomId: json['uomId'],
      uomName: json['uomName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uomId': uomId,
      'uomName': uomName,
    };
  }
}