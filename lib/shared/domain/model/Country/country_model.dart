class CountryModel {
  final int countryId;
  final String countryName;

  CountryModel({required this.countryId, required this.countryName});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
	return CountryModel(
	  countryId: json['countryId'],
	  countryName: json['countryName'],
	);
  }

  Map<String, dynamic> toJson() {
	return {
	  'countryId': countryId,
	  'countryName': countryName,
	};
  }
}