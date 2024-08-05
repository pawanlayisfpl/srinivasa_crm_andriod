class CustomerCreatePostModel {
  String customerName;
  String customerPhone;
  String title;
  String contactPerson;
  String mobile;
  String email;
  String additionalPhone;
  int primarySourceId;
  String zoneId;
  bool customerType;
  double creditLimit;
  String addressLine2;
  String mandal;
  String districtId;
  int assignTo;
  List<int> divisionId;
  int countryId;
  String stateId;
  int cityId;
  int localityId;
  String address;
  String pincode;
  bool isOrganization;
  bool isIndividual;
  String customerCode;
  String faxNo;
  double farmCapacity;

  CustomerCreatePostModel(
      {required this.customerName,
      required this.customerPhone,
      required this.title,
      required this.contactPerson,
      required this.mobile,
      required this.email,
      required this.additionalPhone,
      required this.primarySourceId,
      required this.zoneId,
      required this.customerType,
      required this.creditLimit,
      required this.addressLine2,
      required this.mandal,
      required this.districtId,
      required this.assignTo,
      required this.divisionId,
      required this.countryId,
      required this.stateId,
      required this.cityId,
      required this.localityId,
      required this.address,
      required this.pincode,
      required this.isOrganization,
      required this.isIndividual,
      required this.customerCode,
      required this.faxNo,
      required this.farmCapacity});

  CustomerCreatePostModel.fromJson(Map<String, dynamic> json)
      : customerName = json['customerName'],
        customerPhone = json['customerPhone'],
        title = json['title'],
        contactPerson = json['contactPerson'],
        mobile = json['mobile'],
        email = json['email'],
        additionalPhone = json['additionalPhone'],
        primarySourceId = json['primarySourceId'],
        zoneId = json['zoneId'],
        customerType = json['customerType'],
        creditLimit = json['creditLimit'],
        addressLine2 = json['addressLine2'],
        mandal = json['mandal'],
        districtId = json['districtId'],
        assignTo = json['assignTo'],
        divisionId = List<int>.from(json['divisionId']),
        countryId = json['countryId'],
        stateId = json['stateId'],
        cityId = json['cityId'],
        localityId = json['localityId'],
        address = json['address'],
        pincode = json['pincode'],
        isOrganization = json['isOrganization'],
        isIndividual = json['isIndividual'],
        customerCode = json['customerCode'],
        faxNo = json['faxNo'],
        farmCapacity = json['farmCapacity'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerName'] = customerName;
    data['customerPhone'] = customerPhone;
    data['title'] = title;
    data['contactPerson'] = contactPerson;
    data['mobile'] = mobile;
    data['email'] = email;
    data['additionalPhone'] = additionalPhone;
    data['primarySourceId'] = primarySourceId;
    data['zoneId'] = zoneId;
    data['customerType'] = customerType;
    data['creditLimit'] = creditLimit;
    data['addressLine2'] = addressLine2;
    data['mandal'] = mandal;
    data['districtId'] = districtId;
    data['assignTo'] = assignTo;
    data['divisionId'] = divisionId;
    data['countryId'] = countryId;
    data['stateId'] = stateId;
    data['cityId'] = cityId;
    data['localityId'] = localityId;
    data['address'] = address;
    data['pincode'] = pincode;
    data['isOrganization'] = isOrganization;
    data['isIndividual'] = isIndividual;
    data['customerCode'] = customerCode;
    data['faxNo'] = faxNo;
    data['farmCapacity'] = farmCapacity;
    return data;
  }
}