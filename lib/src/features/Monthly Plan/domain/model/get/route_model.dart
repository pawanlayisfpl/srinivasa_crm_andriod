class RouteModel {
  final int id;
  final String name;

  RouteModel({required this.id, required this.name});

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      id: json['routeId'],
      name: json['routeName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'routeId': id,
      'routeName': name,
    };
  }
}