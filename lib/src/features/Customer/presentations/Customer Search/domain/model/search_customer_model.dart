
import '../../../../../../../shared/domain/model/zone_model.dart';

class SearchCustomerModel {
  int? empId;
  String? empName;
  String? customerCode;
  ZoneModel? zone;
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

  SearchCustomerModel(
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
      this.createdBy});

  SearchCustomerModel.fromJson(Map<String, dynamic> json) {
    empId = json['empId'];
    empName = json['empName'];
    customerCode = json['customerCode'];
    zone = json['zone'] != null ? ZoneModel.fromJson(json['zone']) : null;
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
