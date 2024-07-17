class CityModel {
  int? cityId;
  String? cityName;

  CityModel({this.cityId, this.cityName});

  CityModel.fromJson(Map<String, dynamic> json) {
    cityId = json['cityId'];
    cityName = json['cityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cityId'] = cityId;
    data['cityName'] = cityName;
    return data;
  }
}
