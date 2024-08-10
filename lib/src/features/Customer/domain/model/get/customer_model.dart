class Customermodel {
  String? customerName;
  Farm? farm;

  Customermodel({this.customerName, this.farm});

  Customermodel.fromJson(Map<String, dynamic> json) {
    customerName = json['customerName'];
    farm = json['farm'] != null ? new Farm.fromJson(json['farm']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerName'] = this.customerName;
    if (this.farm != null) {
      data['farm'] = this.farm!.toJson();
    }
    return data;
  }
}

class Farm {
  String? farmName;
  String? customerId;
  int? farmId;
  String? custLocation;
  String? custZone;
  String? contactPerson;
  String? contPersContactNo;
  String? contPersAltContNo;
  String? custCountry;
  String? custStateCode;
  String? custAddress;
  String? custPostal;
  String? createdDate;
  String? createdBy;
  String? custCity;
  String? custCreditLimit;
  String? custStatus;
  bool? isOrganization;
  bool? isIndividual;

  Farm(
      {this.farmName,
      this.customerId,
      this.farmId,
      this.custLocation,
      this.custZone,
      this.contactPerson,
      this.contPersContactNo,
      this.contPersAltContNo,
      this.custCountry,
      this.custStateCode,
      this.custAddress,
      this.custPostal,
      this.createdDate,
      this.createdBy,
      this.custCity,
      this.custCreditLimit,
      this.custStatus,
      this.isOrganization,
      this.isIndividual});

  Farm.fromJson(Map<String, dynamic> json) {
    farmName = json['farmName'];
    customerId = json['customerId'];
    farmId = json['farmId'];
    custLocation = json['custLocation'];
    custZone = json['custZone'];
    contactPerson = json['contactPerson'];
    contPersContactNo = json['contPersContactNo'];
    contPersAltContNo = json['contPersAltContNo'];
    custCountry = json['custCountry'];
    custStateCode = json['custStateCode'];
    custAddress = json['custAddress'];
    custPostal = json['custPostal'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    custCity = json['custCity'];
    custCreditLimit = json['custCreditLimit'];
    custStatus = json['custStatus'];
    isOrganization = json['isOrganization'];
    isIndividual = json['isIndividual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['farmName'] = this.farmName;
    data['customerId'] = this.customerId;
    data['farmId'] = this.farmId;
    data['custLocation'] = this.custLocation;
    data['custZone'] = this.custZone;
    data['contactPerson'] = this.contactPerson;
    data['contPersContactNo'] = this.contPersContactNo;
    data['contPersAltContNo'] = this.contPersAltContNo;
    data['custCountry'] = this.custCountry;
    data['custStateCode'] = this.custStateCode;
    data['custAddress'] = this.custAddress;
    data['custPostal'] = this.custPostal;
    data['createdDate'] = this.createdDate;
    data['createdBy'] = this.createdBy;
    data['custCity'] = this.custCity;
    data['custCreditLimit'] = this.custCreditLimit;
    data['custStatus'] = this.custStatus;
    data['isOrganization'] = this.isOrganization;
    data['isIndividual'] = this.isIndividual;
    return data;
  }
}
