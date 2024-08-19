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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    approvalStatus = json['approvalStatus'];
    comments = json['comments'];
    if (json['dailyPlans'] != null) {
      dailyPlans = <ViewDailyPlanModel>[];
      json['dailyPlans'].forEach((v) {
        dailyPlans!.add(new ViewDailyPlanModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['monthlyPlanId'] = this.monthlyPlanId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['approvalStatus'] = this.approvalStatus;
    data['comments'] = this.comments;
    if (this.dailyPlans != null) {
      data['dailyPlans'] = this.dailyPlans!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['designation'] = this.designation;
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
        customers!.add(new ViewDailyPlanCustomers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dailyPlanId'] = this.dailyPlanId;
    data['planDate'] = this.planDate;
    data['approxKms'] = this.approxKms;
    data['actualKms'] = this.actualKms;
    if (this.customers != null) {
      data['customers'] = this.customers!.map((v) => v.toJson()).toList();
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
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dailyPlanCustDetailsId'] = this.dailyPlanCustDetailsId;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerCode'] = this.customerCode;
    data['customerId'] = this.customerId;
    data['farmId'] = this.farmId;
    data['customerName'] = this.customerName;
    data['customerAddress'] = this.customerAddress;
    data['customerCity'] = this.customerCity;
    data['customerContactNumber'] = this.customerContactNumber;
    data['customerAlternateContactNumber'] =
        this.customerAlternateContactNumber;
    data['customerState'] = this.customerState;
    data['customerEmail'] = this.customerEmail;
    data['customerCategory'] = this.customerCategory;
    data['status'] = this.status;
    data['checkinLocation'] = this.checkinLocation;
    data['checkoutLocation'] = this.checkoutLocation;
    return data;
  }
}
