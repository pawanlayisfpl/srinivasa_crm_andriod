class SingleEmployeModel {
  int? id;
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
  String? username;
  String? obempVendorCode;

  SingleEmployeModel(
      {this.id,
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
      this.username,
      this.obempVendorCode});

  SingleEmployeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionId = json['divisionId'];
    contactNo = json['contactNo'];
    state = json['state'];
    city = json['city'];
    pincode = json['pincode'];
    email = json['email'];
    if (json['authorities'] != null) {
      authorities = <Authorities>[];
      json['authorities'].forEach((v) {
        authorities!.add(new Authorities.fromJson(v));
      });
    }
    if (json['zones'] != null) {
      zones = <Zones>[];
      json['zones'].forEach((v) {
        zones!.add(new Zones.fromJson(v));
      });
    }
    joiningDate = json['joiningDate'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    timeZone = json['timeZone'] != null
        ? new TimeZone.fromJson(json['timeZone'])
        : null;
    reportingTo = json['reportingTo'];
    repostingManagerName = json['repostingManagerName'];
    gender = json['gender'];
    username = json['username'];
    obempVendorCode = json['obempVendorCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['divisionId'] = this.divisionId;
    data['contactNo'] = this.contactNo;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['email'] = this.email;
    if (this.authorities != null) {
      data['authorities'] = this.authorities!.map((v) => v.toJson()).toList();
    }
    if (this.zones != null) {
      data['zones'] = this.zones!.map((v) => v.toJson()).toList();
    }
    data['joiningDate'] = this.joiningDate;
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    if (this.timeZone != null) {
      data['timeZone'] = this.timeZone!.toJson();
    }
    data['reportingTo'] = this.reportingTo;
    data['repostingManagerName'] = this.repostingManagerName;
    data['gender'] = this.gender;
    data['username'] = this.username;
    data['obempVendorCode'] = this.obempVendorCode;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleId'] = this.roleId;
    data['authority'] = this.authority;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['zoneName'] = this.zoneName;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currencyId'] = this.currencyId;
    data['currencyName'] = this.currencyName;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeZoneId'] = this.timeZoneId;
    data['timeZoneName'] = this.timeZoneName;
    return data;
  }
}
