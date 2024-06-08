class PunchoutPostModel {
  String latitude;
  String longitude;

  PunchoutPostModel({
    required this.latitude,
    required this.longitude,
  });

  // Factory constructor for creating a new instance from a map
  factory PunchoutPostModel.fromJson(Map<String, dynamic> json) {
    return PunchoutPostModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  // Method for converting an instance to a map
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
