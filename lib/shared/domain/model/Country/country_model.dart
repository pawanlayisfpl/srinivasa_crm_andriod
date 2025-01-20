// class CountryModel {
//   final String countryId;
//   final String countryName;

//   CountryModel({required this.countryId, required this.countryName});

//   factory CountryModel.fromJson(Map<String, dynamic> json) {
// 	return CountryModel(
// 	  countryId: int.parse(json['countryId']).toString(),
// 	  countryName: json['countryName'],
// 	);
//   }

//   Map<String, dynamic> toJson() {
// 	return {
// 	  'countryId': countryId,
// 	  'countryName': countryName,
// 	};
//   }
// }

class CountryModel {
  final String? countryId;
  final String? countryName;

  CountryModel({this.countryId, this.countryName});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      countryId: json['countryId']?.toString(), // Handle null and convert to String if needed
      countryName: json['countryName'],        // Handle null automatically
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'countryId': countryId,  // Null-safe access
      'countryName': countryName,  // Null-safe access
    };
  }
}
