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
    farmName = json['farmName'];
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['farmId'] = this.farmId;
    data['customerId'] = this.customerId;
    data['farmName'] = this.farmName;
    data['customerName'] = this.customerName;
    data['customerPhone'] = this.customerPhone;
    data['title'] = this.title;
    data['email'] = this.email;
    data['addressLine2'] = this.addressLine2;
    data['creditLimit'] = this.creditLimit;
    data['primarySourceId'] = this.primarySourceId;
    data['zoneId'] = this.zoneId;
    data['kycstatus'] = this.kycstatus;
    data['countryId'] = this.countryId;
    data['stateId'] = this.stateId;
    data['districtId'] = this.districtId;
    data['cityId'] = this.cityId;
    data['localityId'] = this.localityId;
    data['mandal'] = this.mandal;
    data['postalCode'] = this.postalCode;
    data['address'] = this.address;
    data['isIndividual'] = this.isIndividual;
    data['isOrganization'] = this.isOrganization;
    data['contactPerson'] = this.contactPerson;
    data['mobile'] = this.mobile;
    data['alternateContact'] = this.alternateContact;
    data['farmCapacity'] = this.farmCapacity;
    data['assignTo'] = this.assignTo;
    return data;
  }
}
  