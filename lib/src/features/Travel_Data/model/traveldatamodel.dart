class TravelDataModel {
    TravelDataModel({
        required this.data,
        required this.status,
        required this.message,
    });

    final Data? data;
    final bool status;
    final String message;

    factory TravelDataModel.fromJson(Map<String, dynamic> json){ 
        return TravelDataModel(
            data: json["data"] == null ? null : Data.fromJson(json["data"]),
            status: json["status"] ?? false,
            message: json["message"] ?? "",
        );
    }

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "status": status,
        "message": message,
    };

}

class Data {
    Data({
        required this.customDailyReportDtoList,
        required this.totalCount,
    });

    final List<CustomDailyReportDtoList> customDailyReportDtoList;
    final int totalCount;

    factory Data.fromJson(Map<String, dynamic> json){ 
        return Data(
            customDailyReportDtoList: json["customDailyReportDTOList"] == null ? [] : List<CustomDailyReportDtoList>.from(json["customDailyReportDTOList"]!.map((x) => CustomDailyReportDtoList.fromJson(x))),
            totalCount: json["totalCount"] ?? 0,
        );
    }

    Map<String, dynamic> toJson() => {
        "customDailyReportDTOList": customDailyReportDtoList.map((x) => x?.toJson()).toList(),
        "totalCount": totalCount,
    };

}

class CustomDailyReportDtoList {
    CustomDailyReportDtoList({
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

    final int userId;
    final String username;
    final String city;
    final DateTime? punchDate;
    final String reportingManager;
    final String state;
    final String divisionName;
    final dynamic punchInOdometerKms;
    final dynamic punchOutOdometerKms;
    final dynamic punchInOutDistance;
    final dynamic punchInImageLink;
    final dynamic punchOutImageLink;
    final dynamic googleDistance;
    final dynamic modeOfTransport;

    factory CustomDailyReportDtoList.fromJson(Map<String, dynamic> json){ 
        return CustomDailyReportDtoList(
            userId: json["userId"] ?? 0,
            username: json["username"] ?? "",
            city: json["city"] ?? "",
            punchDate: DateTime.tryParse(json["punchDate"] ?? ""),
            reportingManager: json["reportingManager"] ?? "",
            state: json["state"] ?? "",
            divisionName: json["divisionName"] ?? "",
            punchInOdometerKms: json["punchInOdometerKms"] ?? 0,
            punchOutOdometerKms: json["punchOutOdometerKms"] ?? 0,
            punchInOutDistance: json["punchInOutDistance"] ?? 0,
            punchInImageLink: json["punchInImageLink"]??"",
            punchOutImageLink: json["punchOutImageLink"]??"",
            googleDistance: json["googleDistance"] ?? 0,
            modeOfTransport: json["modeOfTransport"] ??"",
        );
    }

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "city": city,
        "punchDate":punchDate,// "${punchDate.year.toString().padLeft(4'0')}-${punchDate.month.toString().padLeft(2'0')}-${punchDate.day.toString().padLeft(2'0')}",
        "reportingManager": reportingManager,
        "state": state,
        "divisionName": divisionName,
        "punchInOdometerKms": punchInOdometerKms,
        "punchOutOdometerKms": punchOutOdometerKms,
        "punchInOutDistance": punchInOutDistance,
        "punchInImageLink": punchInImageLink,
        "punchOutImageLink": punchOutImageLink,
        "googleDistance": googleDistance,
        "modeOfTransport": modeOfTransport,
    };

}
