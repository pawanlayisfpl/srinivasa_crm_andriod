class MonthlyPlanPostModel {
  final String employeeId;
  final List<MonthlyPlans> monthlyPlans;

  MonthlyPlanPostModel({required this.employeeId, required this.monthlyPlans});

  MonthlyPlanPostModel.fromJson(Map<String, dynamic> json)
      : employeeId = json['employeeId'],
        monthlyPlans = List<MonthlyPlans>.from(json['monthlyPlans'].map((x) => MonthlyPlans.fromJson(x)));

  Map<String, dynamic> toJson() {
    return {
      'employeeId': employeeId,
      'monthlyPlans': monthlyPlans.map((plan) => plan.toJson()).toList(),
    };
  }
}

class MonthlyPlans {
  final String createdDate;
  final String routeId;
  final double approxKms;
  final List<CustomerCodes> customerCodes;

  MonthlyPlans({
    required this.createdDate,
    required this.routeId,
    required this.approxKms,
    required this.customerCodes,
  });

  MonthlyPlans.fromJson(Map<String, dynamic> json)
      : createdDate = json['createdDate'],
        routeId = json['routeId'],
        approxKms = json['approxKms'].toDouble(),
        customerCodes = List<CustomerCodes>.from(json['customerCodes'].map((x) => CustomerCodes.fromJson(x)));

  Map<String, dynamic> toJson() {
    return {
      'createdDate': createdDate,
      'routeId': routeId,
      'approxKms': approxKms,
      'customerCodes': customerCodes.map((code) => code.toJson()).toList(),
    };
  }
}

class CustomerCodes {
  final String customerCode;

  CustomerCodes({required this.customerCode});

  CustomerCodes.fromJson(Map<String, dynamic> json)
      : customerCode = json['customerCode'];

  Map<String, dynamic> toJson() {
    return {'customerCode': customerCode};
  }
}
