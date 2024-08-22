
class ProfileModel {
  UserModel? userModel;
  String? jwt;
  bool? status;

  ProfileModel({this.userModel, this.jwt, this.status});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    userModel = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    jwt = json['jwt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userModel != null) {
      data['user'] = userModel!.toJson();
    }
    data['jwt'] = jwt;
    data['status'] = status;
    return data;
  }
}

class UserModel {
  int? id;
  String? password;
  int? roleId;
  int? divisionId;
  String? contactNo;
  String? state;
  String? city;
  String? pincode;
  String? email;
  List<Authorities>? authorities;
  List<Zones>? zones;
  String? joiningDate;
    Currency? currency;
  TimeZone? timeZone;
  int? reportingTo;
  String? repostingManagerName;
  String? gender;
  bool? enabled;
  String? username;

  UserModel(
      {this.id,
      this.password,
      this.roleId,
      this.divisionId,
      this.contactNo,
      this.state,
      this.city,
      this.pincode,
      this.email,
      this.authorities,
      this.zones,
      this.joiningDate,
      this.currency,
      this.timeZone,
      this.reportingTo,
      this.repostingManagerName,
      this.gender,
      this.enabled,
      this.username});

 UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    roleId = json['roleId'];
    divisionId = json['divisionId'];
    contactNo = json['contactNo'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
    email = json['email'];
    if (json['authorities'] != null) {
      authorities = <Authorities>[];
      json['authorities'].forEach((v) {
        authorities!.add(Authorities.fromJson(v));
      });
    }
    if (json['zones'] != null) {
      zones = <Zones>[];
      json['zones'].forEach((v) {
        zones!.add(Zones.fromJson(v));
      });
    }
    joiningDate = json['joiningDate'];
    currency = json['currency'] != null
        ? Currency.fromJson(json['currency'])
        : null;
    timeZone = json['timeZone'] != null
        ? TimeZone.fromJson(json['timeZone'])
        : null;
    reportingTo = json['reportingTo'];
    repostingManagerName = json['repostingManagerName'];
    gender = json['gender'];
    enabled = json['enabled'];
    username = json['username'];
  }

 Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['password'] = password;
    data['roleId'] = roleId;
    data['divisionId'] = divisionId;
    data['contactNo'] = contactNo;
    data['state'] = state;
    data['city'] = city;
    data['pincode'] = pincode;
    data['email'] = email;
    if (authorities != null) {
      data['authorities'] = authorities!.map((v) => v.toJson()).toList();
    }
    if (zones != null) {
      data['zones'] = zones!.map((v) => v.toJson()).toList();
    }
    data['joiningDate'] = joiningDate;
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    if (timeZone != null) {
      data['timeZone'] = timeZone!.toJson();
    }
    data['reportingTo'] = reportingTo;
    data['repostingManagerName'] = repostingManagerName;
    data['gender'] = gender;
    data['enabled'] = enabled;
    data['username'] = username;
    return data;
  }

}

class Authorities {
  int? roleId;  
  String? authority;

  Authorities({this.roleId, this.authority});

  Authorities.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['roleId'] = roleId;
    data['authority'] = authority;
    return data;
  }
}

class Zones {
  String? id;
  String? zoneName;

  Zones({this.id, this.zoneName});

  Zones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zoneName = json['zoneName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['zoneName'] = zoneName;
    return data;
  }

  
}

class Currency {
  String? currencyId;
  String? currencyName;

  Currency({this.currencyId, this.currencyName});

  Currency.fromJson(Map<String, dynamic> json) {
    currencyId = json['currencyId'];
    currencyName = json['currencyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['currencyId'] = currencyId;
    data['currencyName'] = currencyName;
    return data;
  }
}

class TimeZone {
  int? timeZoneId;
  String? timeZoneName;

  TimeZone({this.timeZoneId, this.timeZoneName});

  TimeZone.fromJson(Map<String, dynamic> json) {
    timeZoneId = json['timeZoneId'];
    timeZoneName = json['timeZoneName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['timeZoneId'] = timeZoneId;
    data['timeZoneName'] = timeZoneName;
    return data;
  }
}
