class CustomerFullDetailsResponseModel {
  Body? body;
  bool? status;
  String? message;

  CustomerFullDetailsResponseModel({this.body, this.status, this.message});

  CustomerFullDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Body {
  String? customerName;
  String? customerId;
  int? farmId;
  String? customerPhone;
  String? title;
  String? contactPerson;
  String? phone;
  String? email;
  String? additionalPhone;
  String? primarySource;
  String? custZone;
  bool? customerType;
  dynamic creditLimit;
  String? addressLine2;
  String? mandal;
  District? district;
  AssignTo? assignTo;
  String? custCountry;
  State? state;
  CustCity? custCity;
  Locality? locality;
  String? address;
  String? pincode;
  bool? isOrganization;
  bool? isIndividual;
  String? customerCode;
  String? farmName;
  double? farmCapacity;
  String? createdDate;
  String? createdBy;
  String? custStatus;
  String? locationCode;

  Body(
      {this.customerName,
      this.customerId,
      this.farmId,
      this.customerPhone,
      this.title,
      this.contactPerson,
      this.phone,
      this.email,
      this.additionalPhone,
      this.primarySource,
      this.custZone,
      this.customerType,
      this.creditLimit,
      this.addressLine2,
      this.mandal,
      this.district,
      this.assignTo,
      this.custCountry,
      this.state,
      this.custCity,
      this.locality,
      this.address,
      this.pincode,
      this.isOrganization,
      this.isIndividual,
      this.customerCode,
      this.farmName,
      this.farmCapacity,
      this.createdDate,
      this.createdBy,
      this.custStatus,
      this.locationCode});

  Body.fromJson(Map<String, dynamic> json) {
    customerName = json['customerName'];
    customerId = json['customerId'];
    farmId = json['farmId'];
    customerPhone = json['customerPhone'];
    title = json['title'];
    contactPerson = json['contactPerson'];
    phone = json['phone'];
    email = json['email'];
    additionalPhone = json['additionalPhone'];
    primarySource = json['primarySource'];
    custZone = json['custZone'];
    customerType = json['customerType'];
    creditLimit = json['creditLimit'];
    addressLine2 = json['addressLine2'];
    mandal = json['mandal'];
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    assignTo = json['assignTo'] != null
        ? new AssignTo.fromJson(json['assignTo'])
        : null;
    custCountry = json['custCountry'];
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
    custCity = json['custCity'] != null
        ? new CustCity.fromJson(json['custCity'])
        : null;
    locality = json['locality'] != null
        ? new Locality.fromJson(json['locality'])
        : null;
    address = json['address'];
    pincode = json['pincode'];
    isOrganization = json['isOrganization'];
    isIndividual = json['isIndividual'];
    customerCode = json['customerCode'];
    farmName = json['farmName'];
    farmCapacity = json['farmCapacity'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    custStatus = json['custStatus'];
    locationCode = json['locationCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerName'] = this.customerName;
    data['customerId'] = this.customerId;
    data['farmId'] = this.farmId;
    data['customerPhone'] = this.customerPhone;
    data['title'] = this.title;
    data['contactPerson'] = this.contactPerson;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['additionalPhone'] = this.additionalPhone;
    data['primarySource'] = this.primarySource;
    data['custZone'] = this.custZone;
    data['customerType'] = this.customerType;
    data['creditLimit'] = this.creditLimit;
    data['addressLine2'] = this.addressLine2;
    data['mandal'] = this.mandal;
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.assignTo != null) {
      data['assignTo'] = this.assignTo!.toJson();
    }
    data['custCountry'] = this.custCountry;
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.custCity != null) {
      data['custCity'] = this.custCity!.toJson();
    }
    if (this.locality != null) {
      data['locality'] = this.locality!.toJson();
    }
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['isOrganization'] = this.isOrganization;
    data['isIndividual'] = this.isIndividual;
    data['customerCode'] = this.customerCode;
    data['farmName'] = this.farmName;
    data['farmCapacity'] = this.farmCapacity;
    data['createdDate'] = this.createdDate;
    data['createdBy'] = this.createdBy;
    data['custStatus'] = this.custStatus;
    data['locationCode'] = this.locationCode;
    return data;
  }
}

class District {
  String? districtId;
  String? districtName;

  District({this.districtId, this.districtName});

  District.fromJson(Map<String, dynamic> json) {
    districtId = json['districtId'];
    districtName = json['districtName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['districtId'] = this.districtId;
    data['districtName'] = this.districtName;
    return data;
  }
}

class AssignTo {
  int? userId;
  String? userName;

  AssignTo({this.userId, this.userName});

  AssignTo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    return data;
  }
}

class State {
  String? stateName;
  String? stateId;

  State({this.stateName, this.stateId});

  State.fromJson(Map<String, dynamic> json) {
    stateName = json['stateName'];
    stateId = json['stateId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stateName'] = this.stateName;
    data['stateId'] = this.stateId;
    return data;
  }
}

class CustCity {
  int? cityId;
  String? cityName;

  CustCity({this.cityId, this.cityName});

  CustCity.fromJson(Map<String, dynamic> json) {
    cityId = json['cityId'];
    cityName = json['cityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityId'] = this.cityId;
    data['cityName'] = this.cityName;
    return data;
  }
}

class Locality {
  int? localityId;
  String? localityName;

  Locality({this.localityId, this.localityName});

  Locality.fromJson(Map<String, dynamic> json) {
    localityId = json['localityId'];
    localityName = json['localityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localityId'] = this.localityId;
    data['localityName'] = this.localityName;
    return data;
  }
}
