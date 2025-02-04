class UpdateCustomerPostModel {
  int? farmId;
  String? customerId;
  String? farmName;
  String? customerName;
  String? customerPhone;
  String? title;
  String? email;
  bool? customerType;
  String? addressLine2;
  String? creditLimit;
  int? primarySourceId;
  String? zoneId;
  String? kycstatus;
  int? countryId;
  String? stateId;
  String? districtId;
  int? cityId;
  int? localityId;
  String? mandal;
  String? postalCode;
  String? address;
  bool? isIndividual;
  bool? isOrganization;
  String? contactPerson;
  String? mobile;
  String? alternateContact;
  String? farmCapacity;
  String? faxNo;
  List<int>? divisionId;
  int? assignTo;

  UpdateCustomerPostModel(
      {this.farmId,
      this.customerId,
      this.farmName,
      this.customerName,
      this.customerPhone,
      this.title,
      this.email,
      this.customerType,
      this.addressLine2,
      this.creditLimit,
      this.primarySourceId,
      this.zoneId,
      this.kycstatus,
      this.countryId,
      this.stateId,
      this.districtId,
      this.cityId,
      this.localityId,
      this.mandal,
      this.postalCode,
      this.address,
      this.isIndividual,
      this.isOrganization,
      this.contactPerson,
      this.mobile,
      this.alternateContact,
      this.farmCapacity,
      this.faxNo,
      this.divisionId,
      this.assignTo});

  UpdateCustomerPostModel.fromJson(Map<String, dynamic> json) {
    farmId = json['farmId'];
    customerId = json['customerId'];
    // farmName = json['farmName'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    title = json['title'];
    email = json['email'];
    customerType = json['customerType'];
    addressLine2 = json['addressLine2'];
    creditLimit = json['creditLimit'];
    primarySourceId = json['primarySourceId'];
    zoneId = json['zoneId'];
    kycstatus = json['kycstatus'];
    countryId = json['countryId'];
    stateId = json['stateId'];
    districtId = json['districtId'];
    cityId = json['cityId'];
    localityId = json['localityId'];
    mandal = json['mandal'];
    postalCode = json['postalCode'];
    address = json['address'];
    isIndividual = json['isIndividual'];
    isOrganization = json['isOrganization'];
    contactPerson = json['contactPerson'];
    mobile = json['mobile'];
    alternateContact = json['alternateContact'];
    farmCapacity = json['farmCapacity'];
    faxNo = json['faxNo'];
    divisionId = json['divisionId'].cast<int>();
    assignTo = json['assignTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['farmId'] = farmId;
    data['customerId'] = customerId;
    data['farmName'] = farmName;
    data['customerName'] = customerName;
    data['customerPhone'] = customerPhone;
    data['title'] = title;
    data['email'] = email;
    data['addressLine2'] = addressLine2;
    data['creditLimit'] = creditLimit;
    data['primarySourceId'] = primarySourceId;
    data['zoneId'] = zoneId;
    data['kycstatus'] = kycstatus;
    data['countryId'] = countryId;
    data['stateId'] = stateId;
    data['districtId'] = districtId;
    data['cityId'] = cityId;
    data['localityId'] = localityId;
    data['mandal'] = mandal;
    data['postalCode'] = postalCode;
    data['address'] = address;
    data['isIndividual'] = isIndividual;
    data['isOrganization'] = isOrganization;
    data['contactPerson'] = contactPerson;
    data['mobile'] = mobile;
    data['alternateContact'] = alternateContact;
    data['farmCapacity'] = farmCapacity;
    data['assignTo'] = assignTo;
    return data;
  }
}
  