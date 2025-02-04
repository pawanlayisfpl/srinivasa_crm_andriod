class AllEmployesModel {
  Data? data;
  bool? status;
  String? message;

  AllEmployesModel({this.data, this.status, this.message});

  AllEmployesModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

 
}

class Data {
  List<Users>? users;

  Data({this.users});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }


}
class Users {
  int? id;
  String? userName;
  List<String>? designation;
  String? name;
  String? email;
  String? phoneNumber;
  String? city;
  String? state;
  String? pinCode;
  String? joiningDate;
  String? division;
  ReportingTo? reportingTo;

  Users({
    this.id,
    this.userName,
    this.designation,
    this.name,
    this.email,
    this.phoneNumber,
    this.city,
    this.state,
    this.pinCode,
    this.joiningDate,
    this.division,
    this.reportingTo,
  });

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    userName = json['userName'] as String?;
    designation = (json['designation'] as List?)?.cast<String>();
    name = json['name'] as String?;
    email = json['email'] as String?;
    phoneNumber = json['phoneNumber'] as String?;
    city = json['city'] as String?;
    state = json['state'] as String?;
    pinCode = json['pinCode'] as String?;
    joiningDate = json['joiningDate'] as String?;
    division = json['division'] as String?;
    reportingTo = json['reportingTo'] != null
        ? ReportingTo.fromJson(json['reportingTo'] as Map<String, dynamic>)
        : null;
  }
}

class ReportingTo {
  int? id;
  String? userName;
  List<String>? designation;
  String? name;
  String? email;
  String? phoneNumber;
  String? city;
  String? state;
  String? pinCode;
  String? joiningDate;
  String? division;
  dynamic reportingTo;

  ReportingTo.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    userName = json['userName'] as String?;
    designation = (json['designation'] as List?)?.cast<String>();
    name = json['name'] as String?;
    email = json['email'] as String?;
    phoneNumber = json['phoneNumber'] as String?;
    city = json['city'] as String?;
    state = json['state'] as String?;
    pinCode = json['pinCode'] as String?;
    joiningDate = json['joiningDate'] as String?;
    division = json['division'] as String?;
    reportingTo = json['reportingTo'];
  }
}


