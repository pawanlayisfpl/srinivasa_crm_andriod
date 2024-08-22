class UpdateDailyPlanPostModel {
  int monthlyPlanId;
  int dailyPlanId;
  double actualKms;
  List<String> customerCodes;
  bool confirmed;

  UpdateDailyPlanPostModel({
    required this.monthlyPlanId,
    required this.dailyPlanId,
    required this.actualKms,
    required this.customerCodes,
    required this.confirmed,
  });

  factory UpdateDailyPlanPostModel.fromJson(Map<String, dynamic> json) {
    return UpdateDailyPlanPostModel(
      monthlyPlanId: json['monthlyPlanId'],
      dailyPlanId: json['dailyPlanId'],
      actualKms: json['actualKms'],
      customerCodes: List<String>.from(json['farmIds']),
      confirmed: json['confirmed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'monthlyPlanId': monthlyPlanId,
      'dailyPlanId': dailyPlanId,
      'actualKms': actualKms,
      'farmIds': customerCodes,
      'confirmed': confirmed,
    };
  }
}