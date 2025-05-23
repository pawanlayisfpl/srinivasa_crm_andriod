class CustomerFullDetailsModel {
  int? empId;
  String? empName;
  String? customerCode;
  Zone? zone;
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
  int? longitude;
  int? latitude;

  CustomerFullDetailsModel(
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

  CustomerFullDetailsModel.fromJson(Map<String, dynamic> json) {
    empId = json['empId'];
    empName = json['empName'];
    customerCode = json['customerCode'];
    zone = json['zone'] != null ? Zone.fromJson(json['zone']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empId'] = empId;
    data['empName'] = empName;
    data['customerCode'] = customerCode;
    if (zone != null) {
      data['zone'] = zone!.toJson();
    }
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

class Zone {
  String? id;
  String? zoneName;

  Zone({this.id, this.zoneName});

  Zone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zoneName = json['zoneName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['zoneName'] = zoneName;
    return data;
  }
}
