class StateModel {
  final String stateId;
  final String stateName;
  final String stateCode;

  StateModel({required this.stateId, required this.stateName, required this.stateCode});

  factory StateModel.fromJson(Map<String, dynamic> json) {
	return StateModel(
	  stateId: json['stateId'],
	  stateName: json['stateName'],
	  stateCode: json['stateCode'],
	);
  }

  Map<String, dynamic> toJson() {
	return {
	  'stateId': stateId,
	  'stateName': stateName,
	  'stateCode': stateCode,
	};
  }
}