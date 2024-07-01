class AlertModel {
  int? notificationId;
  int? monthlyPlanId;
  int? dailyPlanId; // Added field
  bool? read;
  String? message;
  String? createdDate;
  String? notifyTo; // Added field
  String? createdBy; // Added field
  String? type; // Added field
  bool? isDailyPlan; // Added field

  AlertModel({
    this.notificationId,
    this.monthlyPlanId,
    this.dailyPlanId, // Initialize in constructor
    this.read,
    this.message,
    this.createdDate,
    this.notifyTo, // Initialize in constructor
    this.createdBy, // Initialize in constructor
    this.type, // Initialize in constructor
    this.isDailyPlan, // Initialize in constructor
  });

  AlertModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notificationId'];
    monthlyPlanId = json['monthlyPlanId'];
    dailyPlanId = json['dailyPlanId']; // Assign from JSON
    read = json['read'];
    message = json['message'];
    createdDate = json['createdDate'];
    notifyTo = json['notifyTo']; // Assign from JSON
    createdBy = json['createdBy']; // Assign from JSON
    type = json['type']; // Assign from JSON
    isDailyPlan = json['isDailyPlan']; // Assign from JSON
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notificationId'] = notificationId;
    data['monthlyPlanId'] = monthlyPlanId;
    data['dailyPlanId'] = dailyPlanId; // Add to JSON
    data['read'] = read;
    data['message'] = message;
    data['createdDate'] = createdDate;
    data['notifyTo'] = notifyTo; // Add to JSON
    data['createdBy'] = createdBy; // Add to JSON
    data['type'] = type; // Add to JSON
    data['isDailyPlan'] = isDailyPlan; // Add to JSON
    return data;
  }
}