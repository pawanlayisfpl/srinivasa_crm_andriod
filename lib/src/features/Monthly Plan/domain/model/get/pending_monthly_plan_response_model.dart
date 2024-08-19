class PendingMonthlyPlanResponseModel {
  final List<PendingMonthlyPlan>? pendingMonthlyPlans;

  PendingMonthlyPlanResponseModel({this.pendingMonthlyPlans});

  factory PendingMonthlyPlanResponseModel.fromJson(Map<String, dynamic> json) {
    return PendingMonthlyPlanResponseModel(
      pendingMonthlyPlans: json['pendingMonthlyPlans'] != null
          ? List<PendingMonthlyPlan>.from(json['pendingMonthlyPlans'].map((x) => PendingMonthlyPlan.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pendingMonthlyPlans': pendingMonthlyPlans?.map((x) => x.toJson()).toList(),
    };
  }
}

class PendingMonthlyPlan {
  final UserDTO? userDTO;
  final int? monthlyPlanId;
  final int? month;
  final String? createdDate;

  PendingMonthlyPlan({this.userDTO, this.monthlyPlanId, this.month, this.createdDate});

  factory PendingMonthlyPlan.fromJson(Map<String, dynamic> json) {
    return PendingMonthlyPlan(
      userDTO: json['userDTO'] != null ? UserDTO.fromJson(json['userDTO']) : null,
      monthlyPlanId: json['monthlyPlanId'],
      month: json['month'],
      createdDate: json['createdDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userDTO': userDTO?.toJson(),
      'monthlyPlanId': monthlyPlanId,
      'month': month,
      'createdDate': createdDate,
    };
  }
}
class UserDTO {
  final int? id;
  final String? userName;
  final List<String>? designation;

  UserDTO({this.id, this.userName, this.designation});

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'],
      userName: json['userName'],
      designation: json['designation'] != null ? List<String>.from(json['designation']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'designation': designation,
    };
  }

}