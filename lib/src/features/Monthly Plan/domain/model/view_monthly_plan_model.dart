class ViewMonthlyPlanModel {
  int? monthlyPlanId;
  User? user;
  String? approvalStatus;
  String? comments;
  List<ViewDailyPlanModel>? dailyPlans;

  ViewMonthlyPlanModel(
      {this.monthlyPlanId,
      this.user,
      this.approvalStatus,
      this.comments,
      this.dailyPlans});

  ViewMonthlyPlanModel.fromJson(Map<String, dynamic> json) {
    monthlyPlanId = json['monthlyPlanId'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    approvalStatus = json['approvalStatus'];
    comments = json['comments'];
    if (json['dailyPlans'] != null) {
      dailyPlans = <ViewDailyPlanModel>[];
      json['dailyPlans'].forEach((v) {
        dailyPlans!.add(ViewDailyPlanModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['monthlyPlanId'] = monthlyPlanId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['approvalStatus'] = approvalStatus;
    data['comments'] = comments;
    if (dailyPlans != null) {
      data['dailyPlans'] = dailyPlans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class User {
  int? id;
  String? userName;
  List<String>? designation;

  User({this.id, this.userName, this.designation});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    designation = json['designation'] != null ? List<String>.from(json['designation']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['designation'] = designation;
    return data;
  }
}

class ViewDailyPlanModel {
  int? dailyPlanId;
  String? planDate;
  double? approxKms;
  double? actualKms;
  List<ViewDailyPlanCustomers>? customers;

  ViewDailyPlanModel(
      {this.dailyPlanId,
      this.planDate,
      this.approxKms,
      this.actualKms,
      this.customers});

  ViewDailyPlanModel.fromJson(Map<String, dynamic> json) {
    dailyPlanId = json['dailyPlanId'];
    planDate = json['planDate'];
    approxKms = json['approxKms'];
    actualKms = json['actualKms'];
    if (json['customers'] != null) {
      customers = <ViewDailyPlanCustomers>[];
      json['customers'].forEach((v) {
        customers!.add(ViewDailyPlanCustomers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dailyPlanId'] = dailyPlanId;
    data['planDate'] = planDate;
    data['approxKms'] = approxKms;
    data['actualKms'] = actualKms;
    if (customers != null) {
      data['customers'] = customers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ViewDailyPlanCustomers {
  int? dailyPlanCustDetailsId;
  Customer? customer;

  ViewDailyPlanCustomers({this.dailyPlanCustDetailsId, this.customer});

  ViewDailyPlanCustomers.fromJson(Map<String, dynamic> json) {
    dailyPlanCustDetailsId = json['dailyPlanCustDetailsId'];
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dailyPlanCustDetailsId'] = dailyPlanCustDetailsId;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}

class Customer {
  String? customerCode;
  String? customerId;
  String? farmId;
  String? customerName;
  String? customerAddress;
  String? customerCity;
  String? customerContactNumber;
  String? customerAlternateContactNumber;
  String? customerState;
  String? customerEmail;
  String? customerCategory;
  String? status;
  String? checkinLocation;
  String? checkoutLocation;

  Customer(
      {this.customerCode,
      this.customerId,
      this.farmId,
      this.customerName,
      this.customerAddress,
      this.customerCity,
      this.customerContactNumber,
      this.customerAlternateContactNumber,
      this.customerState,
      this.customerEmail,
      this.customerCategory,
      this.status,
      this.checkinLocation,
      this.checkoutLocation});

  Customer.fromJson(Map<String, dynamic> json) {
    customerCode = json['customerCode'];
    customerId = json['customerId'];
    farmId = json['farmId'];
    customerName = json['customerName'];
    customerAddress = json['customerAddress'];
    customerCity = json['customerCity'];
    customerContactNumber = json['customerContactNumber'];
    customerAlternateContactNumber = json['customerAlternateContactNumber'];
    customerState = json['customerState'];
    customerEmail = json['customerEmail'];
    customerCategory = json['customerCategory'];
    status = json['status'];
    checkinLocation = json['checkinLocation'];
    checkoutLocation = json['checkoutLocation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerCode'] = customerCode;
    data['customerId'] = customerId;
    data['farmId'] = farmId;
    data['customerName'] = customerName;
    data['customerAddress'] = customerAddress;
    data['customerCity'] = customerCity;
    data['customerContactNumber'] = customerContactNumber;
    data['customerAlternateContactNumber'] =
        customerAlternateContactNumber;
    data['customerState'] = customerState;
    data['customerEmail'] = customerEmail;
    data['customerCategory'] = customerCategory;
    data['status'] = status;
    data['checkinLocation'] = checkinLocation;
    data['checkoutLocation'] = checkoutLocation;
    return data;
  }
}
