// class MonthlyPlanCustomerModel {
//   String? customerCode;
//   String? customerName;
//   String? customerAddress;
//   String? customerCity;
//   String? customerContactNumber;
//   String? customerAlternateContactNumber;
//   String? customerState;
//   String? customerEmail;
//   String? customerCategory;
//   String? status;
//   String? checkinLocation;
//   String? checkoutLocation;

//   MonthlyPlanCustomerModel(
//       {this.customerCode,
//       this.customerName,
//       this.customerAddress,
//       this.customerCity,
//       this.customerContactNumber,
//       this.customerAlternateContactNumber,
//       this.customerState,
//       this.customerEmail,
//       this.customerCategory,
//       this.status,
//       this.checkinLocation,
//       this.checkoutLocation});

//   MonthlyPlanCustomerModel.fromJson(Map<String, dynamic> json) {
//     customerCode = json['customerCode'];
//     customerName = json['custName'];
//     customerAddress = json['customerAddress'];
//     customerCity = json['customerCity'];
//     customerContactNumber = json['customerContactNumber'];
//     customerAlternateContactNumber = json['customerAlternateContactNumber'];
//     customerState = json['customerState'];
//     customerEmail = json['customerEmail'];
//     customerCategory = json['customerCategory'];
//     status = json['status'];
//     checkinLocation = json['checkinLocation'];
//     checkoutLocation = json['checkoutLocation'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['customerCode'] = customerCode;
//     data['customerName'] = customerName;
//     data['customerAddress'] = customerAddress;
//     data['customerCity'] = customerCity;
//     data['customerContactNumber'] = customerContactNumber;
//     data["customerAlternateContactNumber"] =
//         customerAlternateContactNumber;
//     data['customerState'] = customerState;
//     data['customerEmail'] = customerEmail;
//     data['customerCategory'] = customerCategory;
//     data['status'] = status;
//     data['checkinLocation'] = checkinLocation;
//     data['checkoutLocation'] = checkoutLocation;
//     return data;
//   }
// }


class MonthlyPlanCustomerModel {
  String? customerName;
  Farm? farm;

  MonthlyPlanCustomerModel({this.customerName, this.farm});

  MonthlyPlanCustomerModel.fromJson(Map<String, dynamic> json) {
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
    data['isOrganization'] = isOrganization;
    data['isIndividual'] = isIndividual;
    return data;
  }
}

