class DivisionModel {
  final String districtId;
  final String districtName;

  DivisionModel({required this.districtId, required this.districtName});

  factory DivisionModel.fromJson(Map<String, dynamic> json) {
	return DivisionModel(
	  districtId: json['districtId'],
	  districtName: json['districtName'],
	);
  }

  Map<String, dynamic> toJson() {
	return {
	  'districtId': districtId,
	  'districtName': districtName,
	};
  }
}