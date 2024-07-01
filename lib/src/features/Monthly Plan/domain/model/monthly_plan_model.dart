class MonthlyPlanModel {
  UserDTO? userDTO;
  String? date;
  CustomerZoneMap? customerZoneMap;
  int? approxKms;
  int? actualKms;
  String? status;
  int? checkInLocation;
  int? checkOutLocation;
  int? planId;

  MonthlyPlanModel(
      {this.userDTO,
      this.date,
      this.customerZoneMap,
      this.approxKms,
      this.actualKms,
      this.status,
      this.checkInLocation,
      this.checkOutLocation,
      this.planId});

  MonthlyPlanModel.fromJson(Map<String, dynamic> json) {
    userDTO =
        json['userDTO'] != null ? new UserDTO.fromJson(json['userDTO']) : null;
    date = json['date'];
    customerZoneMap = json['customerZoneMap'] != null
        ? new CustomerZoneMap.fromJson(json['customerZoneMap'])
        : null;
    approxKms = json['approxKms'];
    actualKms = json['actualKms'];
    status = json['status'];
    checkInLocation = json['checkInLocation'];
    checkOutLocation = json['checkOutLocation'];
    planId = json['planId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (userDTO != null) {
      data['userDTO'] = userDTO!.toJson();
    }
    data['date'] = date;
    if (customerZoneMap != null) {
      data['customerZoneMap'] = customerZoneMap!.toJson();
    }
    data['approxKms'] = approxKms;
    data['actualKms'] = actualKms;
    data['status'] = status;
    data['checkInLocation'] = checkInLocation;
    data['checkOutLocation'] = checkOutLocation;
    data['planId'] = planId;
    return data;
  }
}

class UserDTO {
  int? id;
  String? userName;

  UserDTO({this.id, this.userName});

  UserDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    return data;
  }
}

class CustomerZoneMap {
  ZoneDTOZoneNameVIZIANAGARAMZoneIdZ10040?
      zoneDTOZoneNameVIZIANAGARAMZoneIdZ10040;
  ZoneDTOZoneNameVIZIANAGARAMZoneIdZ10040?
      zoneDTOZoneNameUttarPradeshZoneIdZ10002;

  CustomerZoneMap(
      {this.zoneDTOZoneNameVIZIANAGARAMZoneIdZ10040,
      this.zoneDTOZoneNameUttarPradeshZoneIdZ10002});

  CustomerZoneMap.fromJson(Map<String, dynamic> json) {
    zoneDTOZoneNameVIZIANAGARAMZoneIdZ10040 =
        json['ZoneDTO(zoneName=VIZIANAGARAM, zoneId=z10040)'] != null
            ? new ZoneDTOZoneNameVIZIANAGARAMZoneIdZ10040.fromJson(
                json['ZoneDTO(zoneName=VIZIANAGARAM, zoneId=z10040)'])
            : null;
    zoneDTOZoneNameUttarPradeshZoneIdZ10002 =
        json['ZoneDTO(zoneName=Uttar Pradesh, zoneId=z10002)'] != null
            ? new ZoneDTOZoneNameVIZIANAGARAMZoneIdZ10040.fromJson(
                json['ZoneDTO(zoneName=Uttar Pradesh, zoneId=z10002)'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (zoneDTOZoneNameVIZIANAGARAMZoneIdZ10040 != null) {
      data['ZoneDTO(zoneName=VIZIANAGARAM, zoneId=z10040)'] =
          zoneDTOZoneNameVIZIANAGARAMZoneIdZ10040!.toJson();
    }
    if (zoneDTOZoneNameUttarPradeshZoneIdZ10002 != null) {
      data['ZoneDTO(zoneName=Uttar Pradesh, zoneId=z10002)'] =
          zoneDTOZoneNameUttarPradeshZoneIdZ10002!.toJson();
    }
    return data;
  }
}

class ZoneDTOZoneNameVIZIANAGARAMZoneIdZ10040 {
  String? empId;
  String? empName;
  String? customerCode;
  String? zone;
  String? customerType;
  String? custName;
  String? custPhone;
  String? custAltPhone;
  String? custLocation;
  String? custContactPerson;
  String? custContPersContactNo;
  String? custContPersAltContNo;
  String? custEmail;
  String? custBirthDate;
  String? custCountry;
  String? custStateCode;
  String? custAddress;
  String? custPostal;
  String? typeOfCompany;
  String? createdDate;
  String? createdBy;
  String? custCity;
  String? custCreditLimit;
  String? custStatus;
  String? custPrimarySource;
  String? longitude;
  String? latitude;

  ZoneDTOZoneNameVIZIANAGARAMZoneIdZ10040(
      {this.empId,
      this.empName,
      this.customerCode,
      this.zone,
      this.customerType,
      this.custName,
      this.custPhone,
      this.custAltPhone,
      this.custLocation,
      this.custContactPerson,
      this.custContPersContactNo,
      this.custContPersAltContNo,
      this.custEmail,
      this.custBirthDate,
      this.custCountry,
      this.custStateCode,
      this.custAddress,
      this.custPostal,
      this.typeOfCompany,
      this.createdDate,
      this.createdBy,
      this.custCity,
      this.custCreditLimit,
      this.custStatus,
      this.custPrimarySource,
      this.longitude,
      this.latitude});

  ZoneDTOZoneNameVIZIANAGARAMZoneIdZ10040.fromJson(Map<String, dynamic> json) {
    empId = json['empId'];
    empName = json['empName'];
    customerCode = json['customerCode'];
    zone = json['zone'];
    customerType = json['customerType'];
    custName = json['custName'];
    custPhone = json['custPhone'];
    custAltPhone = json['custAltPhone'];
    custLocation = json['custLocation'];
    custContactPerson = json['custContactPerson'];
    custContPersContactNo = json['custContPersContactNo'];
    custContPersAltContNo = json['custContPersAltContNo'];
    custEmail = json['custEmail'];
    custBirthDate = json['custBirthDate'];
    custCountry = json['custCountry'];
    custStateCode = json['custStateCode'];
    custAddress = json['custAddress'];
    custPostal = json['custPostal'];
    typeOfCompany = json['typeOfCompany'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    custCity = json['custCity'];
    custCreditLimit = json['custCreditLimit'];
    custStatus = json['custStatus'];
    custPrimarySource = json['custPrimarySource'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empId'] = empId;
    data['empName'] = empName;
    data['customerCode'] = customerCode;
    data['zone'] = zone;
    data['customerType'] = customerType;
    data['custName'] = custName;
    data['custPhone'] = custPhone;
    data['custAltPhone'] = custAltPhone;
    data['custLocation'] = custLocation;
    data['custContactPerson'] = custContactPerson;
    data['custContPersContactNo'] = custContPersContactNo;
    data['custContPersAltContNo'] = custContPersAltContNo;
    data['custEmail'] = custEmail;
    data['custBirthDate'] = custBirthDate;
    data['custCountry'] = custCountry;
    data['custStateCode'] = custStateCode;
    data['custAddress'] = custAddress;
    data['custPostal'] = custPostal;
    data['typeOfCompany'] = typeOfCompany;
    data['createdDate'] = createdDate;
    data['createdBy'] = createdBy;
    data['custCity'] = custCity;
    data['custCreditLimit'] = custCreditLimit;
    data['custStatus'] = custStatus;
    data['custPrimarySource'] = custPrimarySource;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}
