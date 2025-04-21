class TravelDataModel {
    TravelDataModel({
        required this.userId,
        required this.username,
        required this.city,
        required this.punchDate,
        required this.reportingManager,
        required this.state,
        required this.divisionName,
        required this.punchInOdometerKms,
        required this.punchOutOdometerKms,
        required this.punchInOutDistance,
        required this.punchInImageLink,
        required this.punchOutImageLink,
        required this.googleDistance,
        required this.modeOfTransport,
    });

    final int? userId;
    final String? username;
    final String? city;
    final DateTime? punchDate;
    final String? reportingManager;
    final String? state;
    final String? divisionName;
    final int? punchInOdometerKms;
    final int? punchOutOdometerKms;
    final int? punchInOutDistance;
    final String? punchInImageLink;
    final String? punchOutImageLink;
    final int? googleDistance;
    final String? modeOfTransport;

    factory TravelDataModel.fromJson(Map<String, dynamic> json){ 
        return TravelDataModel(
            userId: json["userId"],
            username: json["username"],
            city: json["city"],
            punchDate: DateTime.tryParse(json["punchDate"] ?? ""),
            reportingManager: json["reportingManager"],
            state: json["state"],
            divisionName: json["divisionName"],
            punchInOdometerKms: json["punchInOdometerKms"],
            punchOutOdometerKms: json["punchOutOdometerKms"],
            punchInOutDistance: json["punchInOutDistance"],
            punchInImageLink: json["punchInImageLink"],
            punchOutImageLink: json["punchOutImageLink"],
            googleDistance: json["googleDistance"],
            modeOfTransport: json["modeOfTransport"],
        );
    }

}
