class Customermodel {
  String? customerName;
  Farm? farm;

  Customermodel({this.customerName, this.farm});

  Customermodel.fromJson(Map<String, dynamic> json) {
    customerName = json['customerName'];
    farm = json['farm'] != null ? Farm.fromJson(json['farm']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerName'] = customerName;
    if (farm != null) {
      data['farm'] = farm!.toJson();
    }
    return data;
  }
}


// class Farm {
//   String? farmName;
//   String? customerId;
//   int? farmId;
//   String? custLocation;
//   String? custZone;
//   String? contactPerson;
//   String? contPersContactNo;
//   String? contPersAltContNo;
//   String? custCountry;
//   String? custStateCode;
//   String? custAddress;
//   String? custPostal;
//   String? createdDate;
//   String? createdBy;
//   String? custCity;
//   String? custCreditLimit;
//   String? custStatus;
//   bool? isOrganization;
//   bool? isIndividual;
//   bool? checkInStatus;

//   Farm(
//       {this.farmName,
//       this.customerId,
//       this.farmId,
//       this.custLocation,
//       this.custZone,
//       this.contactPerson,
//       this.contPersContactNo,
//       this.contPersAltContNo,
//       this.custCountry,
//       this.custStateCode,
//       this.custAddress,
//       this.custPostal,
//       this.createdDate,
//       this.createdBy,
//       this.custCity,
//       this.custCreditLimit,
//       this.custStatus,
//       this.isOrganization,
//       this.checkInStatus,
//       this.isIndividual});

//   Farm.fromJson(Map<String, dynamic> json) {
//     farmName = json['farmName'];
//     customerId = json['customerId'];
//     farmId = json['farmId'];
//     custLocation = json['custLocation'];
//     custZone = json['custZone'];
//     contactPerson = json['contactPerson'];
//     contPersContactNo = json['contPersContactNo'];
//     contPersAltContNo = json['contPersAltContNo'];
//     custCountry = json['custCountry'];
//     custStateCode = json['custStateCode'];
//     custAddress = json['custAddress'];
//     custPostal = json['custPostal'];
//     createdDate = json['createdDate'];
//     createdBy = json['createdBy'];
//     custCity = json['custCity'];
//     custCreditLimit = json['custCreditLimit'];
//     custStatus = json['custStatus'];
//     isOrganization = json['isOrganization'];
//     isIndividual = json['isIndividual'];
//     checkInStatus = json["checkInStatus"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['farmName'] = this.farmName;
//     data['customerId'] = this.customerId;
//     data['farmId'] = this.farmId;
//     data['custLocation'] = this.custLocation;
//     data['custZone'] = this.custZone;
//     data['contactPerson'] = this.contactPerson;
//     data['contPersContactNo'] = this.contPersContactNo;
//     data['contPersAltContNo'] = this.contPersAltContNo;
//     data['custCountry'] = this.custCountry;
//     data['custStateCode'] = this.custStateCode;
//     data['custAddress'] = this.custAddress;
//     data['custPostal'] = this.custPostal;
//     data['createdDate'] = this.createdDate;
//     data['createdBy'] = this.createdBy;
//     data['custCity'] = this.custCity;
//     data['custCreditLimit'] = this.custCreditLimit;
//     data['custStatus'] = this.custStatus;
//     data['isOrganization'] = this.isOrganization;
//     data['isIndividual'] = this.isIndividual;
//     data['checkInStatus'] = this.checkInStatus;
//     return data;
//   }
// }


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
  String? customerCode;
  String? locationCode;
  bool? isOrganization;
  bool? isIndividual;
  bool? checkInStatus;
  String? longitude;
  String? latitude;

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
      this.customerCode,
      this.locationCode,
      this.isOrganization,
      this.isIndividual,
      this.checkInStatus,
      this.longitude,
      this.latitude});

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
    customerCode = json['customerCode'];
    locationCode = json['locationCode'];
    isOrganization = json['isOrganization'];
    isIndividual = json['isIndividual'];
    checkInStatus = json['checkInStatus'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['farmName'] = farmName;
    data['customerId'] = customerId;
    data['farmId'] = farmId;
    data['custLocation'] = custLocation;
    data['custZone'] = custZone;
    data['contactPerson'] = contactPerson;
    data['contPersContactNo'] = contPersContactNo;
    data['contPersAltContNo'] = contPersAltContNo;
    data['custCountry'] = custCountry;
    data['custStateCode'] = custStateCode;
    data['custAddress'] = custAddress;
    data['custPostal'] = custPostal;
    data['createdDate'] = createdDate;
    data['createdBy'] = createdBy;
    data['custCity'] = custCity;
    data['custCreditLimit'] = custCreditLimit;
    data['custStatus'] = custStatus;
    data['customerCode'] = customerCode;
    data['LocationCode'] = locationCode;
    data['isOrganization'] = isOrganization;
    data['isIndividual'] = isIndividual;
    data['checkInStatus'] = checkInStatus;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}
