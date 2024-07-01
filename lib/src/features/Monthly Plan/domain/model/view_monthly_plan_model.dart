class ViewMonthlyPlanModel {
  int? monthlyPlanId;
  User? user;
  String? approvalStatus;
  String? comments;
  List<ViewDailyPlanModel>? viewDailyPlanModel;

  ViewMonthlyPlanModel(
      {this.monthlyPlanId,
      this.user,
      this.approvalStatus,
      this.comments,
      this.viewDailyPlanModel});

  ViewMonthlyPlanModel.fromJson(Map<String, dynamic> json) {
    monthlyPlanId = json['monthlyPlanId'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    approvalStatus = json['approvalStatus'];
    comments = json['comments'];
    if (json['dailyPlans'] != null) {
      viewDailyPlanModel = <ViewDailyPlanModel>[];
      json['dailyPlans'].forEach((v) {
        viewDailyPlanModel!.add(ViewDailyPlanModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['monthlyPlanId'] = monthlyPlanId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['approvalStatus'] = approvalStatus;
    data['comments'] = comments;
    if (viewDailyPlanModel != null) {
      data['dailyPlans'] =
          viewDailyPlanModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? userName;
  String? designation;

  User({this.id, this.userName, this.designation});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
  List<ViewDailyPlanCustomers>? viewDailyPlanCustomers;

  ViewDailyPlanModel(
      {this.dailyPlanId,
      this.planDate,
      this.approxKms,
      this.actualKms,
      this.viewDailyPlanCustomers});

  ViewDailyPlanModel.fromJson(Map<String, dynamic> json) {
    dailyPlanId = json['dailyPlanId'];
    planDate = json['planDate'];
    approxKms = json['approxKms'];
    actualKms = json['actualKms'];
    if (json['customers'] != null) {
      viewDailyPlanCustomers = <ViewDailyPlanCustomers>[];
      json['customers'].forEach((v) {
        viewDailyPlanCustomers!.add(ViewDailyPlanCustomers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['dailyPlanId'] = dailyPlanId;
    data['planDate'] = planDate;
    data['approxKms'] = approxKms;
    data['actualKms'] = actualKms;
    if (viewDailyPlanCustomers != null) {
      data['customers'] =
          viewDailyPlanCustomers!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['dailyPlanCustDetailsId'] = dailyPlanCustDetailsId;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}

class Customer {
  String? customerCode;
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
