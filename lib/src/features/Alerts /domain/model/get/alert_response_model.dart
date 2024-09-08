// class AlertModel {
//   int? notificationId;
//   int? monthlyPlanId;
//   int? dailyPlanId; // Added field
//   bool? read;
//   String? message;
//   String? createdDate;
//   String? notifyTo; // Added field
//   String? createdBy; // Added field
//   String? type; // Added field
//   bool? isDailyPlan; // Added field

//   AlertModel({
//     this.notificationId,
//     this.monthlyPlanId,
//     this.dailyPlanId, // Initialize in constructor
//     this.read,
//     this.message,
//     this.createdDate,
//     this.notifyTo, // Initialize in constructor
//     this.createdBy, // Initialize in constructor
//     this.type, // Initialize in constructor
//     this.isDailyPlan, // Initialize in constructor
//   });

//   AlertModel.fromJson(Map<String, dynamic> json) {
//     notificationId = json['notificationId'];
//     monthlyPlanId = json['monthlyPlanId'];
//     dailyPlanId = json['dailyPlanId']; // Assign from JSON
//     read = json['read'];
//     message = json['message'];
//     createdDate = json['createdDate'];
//     notifyTo = json['notifyTo']; // Assign from JSON
//     createdBy = json['createdBy']; // Assign from JSON
//     type = json['type']; // Assign from JSON
//     isDailyPlan = json['isDailyPlan']; // Assign from JSON
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['notificationId'] = notificationId;
//     data['monthlyPlanId'] = monthlyPlanId;
//     data['dailyPlanId'] = dailyPlanId; // Add to JSON
//     data['read'] = read;
//     data['message'] = message;
//     data['createdDate'] = createdDate;
//     data['notifyTo'] = notifyTo; // Add to JSON
//     data['createdBy'] = createdBy; // Add to JSON
//     data['type'] = type; // Add to JSON
//     data['isDailyPlan'] = isDailyPlan; // Add to JSON
//     return data;
//   }
// }

class AlertModel {
  int? notificationId;
  int? monthlyPlanId;
  int? dailyPlanId;
  bool? read;
  String? message;
  DateTime? createdDate;
  int? notifyTo;
  int? createdBy;
  String? type;
  bool? isDailyPlan;
  String? monthlyPlanStatus;
  String? notificationType;
  int? notificationTypeId;

  AlertModel({
    this.notificationId,
    this.monthlyPlanId,
    this.dailyPlanId,
    this.read,
    this.message,
    this.createdDate,
    this.notifyTo,
    this.createdBy,
    this.type,
    this.isDailyPlan,
    this.monthlyPlanStatus,
    this.notificationType,
    this.notificationTypeId,
  });

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      notificationId: json['notificationId'] as int?,
      monthlyPlanId: json['monthlyPlanId'] as int?,
      dailyPlanId: json['dailyPlanId'] as int?,
      read: json['read'] as bool?,
      message: json['message'] as String?,
      createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : null,
      notifyTo: json['notifyTo'] as int?,
      createdBy: json['createdBy'] as int?,
      type: json['type'] as String?,
      isDailyPlan: json['isDailyPlan'] as bool?,
      monthlyPlanStatus: json['monthlyPlanStatus'] as String?,
      notificationType: json['notificationType'] as String?,
      notificationTypeId: json['notificationTypeId'] as int?,
    );
  }


  factory AlertModel.fromSqfliteJson(Map<String, dynamic> json) {
  return AlertModel(
    notificationId: json['notificationId'] as int?,
    monthlyPlanId: json['monthlyPlanId'] as int?,
    dailyPlanId: json['dailyPlanId'] as int?,
    read: (json['read'] as int?) == 1 ? true : false,  // Convert 1/0 to true/false
    message: json['message'] as String?,
    createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : null,
    notifyTo: json['notifyTo'] as int?,
    createdBy: json['createdBy'] as int?,
    type: json['type'] as String?,
    isDailyPlan: (json['isDailyPlan'] as int?) == 1 ? true : false,  // Convert 1/0 to true/false
    monthlyPlanStatus: json['monthlyPlanStatus'] as String?,
    notificationType: json['notificationType'] as String?,
    notificationTypeId: json['notificationTypeId'] as int?,
  );
  }

 Map<String, dynamic> toJson() {
  return {
    'notificationId': notificationId,
    'monthlyPlanId': monthlyPlanId,
    'dailyPlanId': dailyPlanId,
    'read': read != null ? read == true  ? 1 : 0 : 0,  // Convert bool to int
    'message': message,
    'createdDate': createdDate?.toIso8601String(),
    'notifyTo': notifyTo,
    'createdBy': createdBy,
    'type': type,
    'isDailyPlan': isDailyPlan != null ? isDailyPlan == true  ? 1 : 0 : 0,  // Convert bool to int
    'monthlyPlanStatus': monthlyPlanStatus,
    'notificationType': notificationType,
    'notificationTypeId': notificationTypeId,
  };
}
}