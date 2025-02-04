class CustomerFullDetailsResponseModel {
  Body? body;
  bool? status;
  String? message;

  CustomerFullDetailsResponseModel({this.body, this.status, this.message});

  CustomerFullDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (body != null) {
      data['body'] = body!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
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
  // String? primarySource;
  String? custZone;
  bool? customerType;
  double? creditLimit;
  String? addressLine2;
  String? mandal;
  District? district;
  PrimarySource? primarySource;
  CustZoneModel? zoneModel;
  AssignTo? assignTo;
  CustCountry? custCountry;
  State? state;
  CustCity? custCity;
  Locality? locality;
  String? address;
  String? pincode;
  bool? isOrganization;
  bool? isIndividual;
  String? customerCode;
  String? farmName;
  dynamic farmCapacity;
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
      this.zoneModel,
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
    // primarySource = json['primarySource'];
    zoneModel = json['custZone'] != null ? CustZoneModel.fromJson(json['custZone']) : null;
    customerType = json['customerType'];
    creditLimit = double.tryParse(json['creditLimit'].toString()) ?? 0.0;
    addressLine2 = json['addressLine2'];
    mandal = json['mandal'];
    district = json['district'] != null
        ? District.fromJson(json['district'])
        : null;

        primarySource = json["primarySource"] != null ? PrimarySource.fromJson(json["primarySource"]) : null;
        zoneModel = json["custZone"] != null ? CustZoneModel.fromJson(json["custZone"]) : null;
    assignTo = json['assignTo'] != null
        ? AssignTo.fromJson(json['assignTo'])
        : null;

    custCountry = json['custCountry'] != null ? CustCountry.fromJson(json['custCountry']) : null;
    state = json['state'] != null ? State.fromJson(json['state']) : null;
    custCity = json['custCity'] != null
        ? CustCity.fromJson(json['custCity'])
        : null;
    locality = json['locality'] != null
        ? Locality.fromJson(json['locality'])
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerName'] = customerName;
    data['customerId'] = customerId;
    data['farmId'] = farmId;
    data['customerPhone'] = customerPhone;
    data['title'] = title;
    data['contactPerson'] = contactPerson;
    data['phone'] = phone;
    data['email'] = email;
    data['additionalPhone'] = additionalPhone;
    data['primarySource'] = primarySource;
    data['custZone'] = custZone;
    data['customerType'] = customerType;
    data['creditLimit'] = creditLimit;
    data['addressLine2'] = addressLine2;
    data['mandal'] = mandal;
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (assignTo != null) {
      data['assignTo'] = assignTo!.toJson();
    }
    data['custCountry'] = custCountry;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (custCity != null) {
      data['custCity'] = custCity!.toJson();
    }
    if (locality != null) {
      data['locality'] = locality!.toJson();
    }
    data['address'] = address;
    data['pincode'] = pincode;
    data['isOrganization'] = isOrganization;
    data['isIndividual'] = isIndividual;
    data['customerCode'] = customerCode;
    data['farmName'] = farmName;
    data['farmCapacity'] = farmCapacity;
    data['createdDate'] = createdDate;
    data['createdBy'] = createdBy;
    data['custStatus'] = custStatus;
    data['locationCode'] = locationCode;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['districtId'] = districtId;
    data['districtName'] = districtName;
    return data;
  }
}

class PrimarySource {
  int? primarySourceId;
  String? primarySourceName;


  PrimarySource.fromJson(Map<String, dynamic> json) {
    primarySourceId = json['primarySourceId'];
    primarySourceName = json['primarySourceName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['primarySourceId'] = primarySourceId;
    data['primarySourceName'] = primarySourceName;
    return data;
  }
}


class CustZoneModel {
  String? zoneName;
  String? zoneId;


  CustZoneModel.fromJson(Map<String, dynamic> json) {
    zoneId = json['zoneId'];
    zoneName = json['zoneName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zoneId'] = zoneId;
    data['zoneName'] = zoneName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userName'] = userName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stateName'] = stateName;
    data['stateId'] = stateId;
    return data;
  }
}

class CustCountry {
  String? name;
  int? id;

  CustCountry({this.name, this.id});

  CustCountry.fromJson(Map<String, dynamic> json) {
    name = json['countryName'];
    id = json['countryId'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cityId'] = cityId;
    data['cityName'] = cityName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['localityId'] = localityId;
    data['localityName'] = localityName;
    return data;
  }
}
