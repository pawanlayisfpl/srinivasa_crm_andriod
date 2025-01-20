class UpdateCustomerModel {
  bool? isSubmitting;
  bool? isLoading;
  int? farmId;
  String? customerId;
  String? farmName;
  String? customerName;
  String? customerPhone;
  String? title;
  String? email;
  String? additionalPhone;
  bool? customerType;
  String? addressLine2;
  double? creditLimit;
  int? primarySourceId;
  String? zoneId;
  String? kycStatus;
  List<String>? titleList;
  int? countryId;
  String? stateId;
  String? districtId;
  int? cityId;
  int? localityId;
  String? mandal;
  String? postalCode;
  String? address;
  String? contactPerson;
  String? faxNo;
  String? mobile;
  String? alternateContact;
  bool? isIndividual;
  bool? isOrganization;
  List<int>? divisionId;
  double? farmCapacity;
  int? assignTo;

  UpdateCustomerModel({
    this.isSubmitting,
    this.isLoading,
    this.farmId,
    this.customerId,
    this.farmName,
    this.customerName,
    this.customerPhone,
    this.title,
    this.email,
    this.additionalPhone,
    this.customerType,
    this.addressLine2,
    this.creditLimit,
    this.primarySourceId,
    this.zoneId,
    this.kycStatus,
    this.titleList,

    this.countryId,
    this.stateId,
    this.districtId,
    this.cityId,
    this.localityId,
    this.mandal,
    this.postalCode,
    this.address,
    this.contactPerson,
    this.faxNo,
    this.mobile,
    this.alternateContact,
    this.isIndividual,
    this.isOrganization,
    this.divisionId,
    this.farmCapacity,
    this.assignTo,
  });
}
