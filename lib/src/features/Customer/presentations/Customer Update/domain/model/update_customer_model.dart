class UpdateCustomerModel {
  final int farmId;
  final String customerId;
  final String farmName;
  final String customerName;
  final String customerPhone;
  final String title;
  final String email;
  final bool customerType;
  final String addressLine2;
  final double creditLimit;
  final int primarySourceId;
  final String zoneId;
  final String kycStatus;
  final int countryId;
  final String stateId;
  final String districtId;
  final int cityId;
  final int localityId;
  final String mandal;
  final String postalCode;
  final String address;
  final bool isIndividual;
  final bool isOrganization;
  final String contactPerson;
  final String mobile;
  final String alternateContact;
  final double farmCapacity;
  final String faxNo;
  final List<int> divisionId;
  final int assignTo;

  UpdateCustomerModel({
    required this.farmId,
    required this.customerId,
    required this.farmName,
    required this.customerName,
    required this.customerPhone,
    required this.title,
    required this.email,
    required this.customerType,
    required this.addressLine2,
    required this.creditLimit,
    required this.primarySourceId,
    required this.zoneId,
    required this.kycStatus,
    required this.countryId,
    required this.stateId,
    required this.districtId,
    required this.cityId,
    required this.localityId,
    required this.mandal,
    required this.postalCode,
    required this.address,
    required this.isIndividual,
    required this.isOrganization,
    required this.contactPerson,
    required this.mobile,
    required this.alternateContact,
    required this.farmCapacity,
    required this.faxNo,
    required this.divisionId,
    required this.assignTo,
  });

  /// Creates a new instance of `Customer` with updated fields.
  /// Fields not specified in the method call retain their original values.
  UpdateCustomerModel copyWith({
    int? farmId,
    String? customerId,
    String? farmName,
    String? customerName,
    String? customerPhone,
    String? title,
    String? email,
    bool? customerType,
    String? addressLine2,
    double? creditLimit,
    int? primarySourceId,
    String? zoneId,
    String? kycStatus,
    int? countryId,
    String? stateId,
    String? districtId,
    int? cityId,
    int? localityId,
    String? mandal,
    String? postalCode,
    String? address,
    bool? isIndividual,
    bool? isOrganization,
    String? contactPerson,
    String? mobile,
    String? alternateContact,
    double? farmCapacity,
    String? faxNo,
    List<int>? divisionId,
    int? assignTo,
  }) {
    return UpdateCustomerModel(
      farmId: farmId ?? this.farmId,
      customerId: customerId ?? this.customerId,
      farmName: farmName ?? this.farmName,
      customerName: customerName ?? this.customerName,
      customerPhone: customerPhone ?? this.customerPhone,
      title: title ?? this.title,
      email: email ?? this.email,
      customerType: customerType ?? this.customerType,
      addressLine2: addressLine2 ?? this.addressLine2,
      creditLimit: creditLimit ?? this.creditLimit,
      primarySourceId: primarySourceId ?? this.primarySourceId,
      zoneId: zoneId ?? this.zoneId,
      kycStatus: kycStatus ?? this.kycStatus,
      countryId: countryId ?? this.countryId,
      stateId: stateId ?? this.stateId,
      districtId: districtId ?? this.districtId,
      cityId: cityId ?? this.cityId,
      localityId: localityId ?? this.localityId,
      mandal: mandal ?? this.mandal,
      postalCode: postalCode ?? this.postalCode,
      address: address ?? this.address,
      isIndividual: isIndividual ?? this.isIndividual,
      isOrganization: isOrganization ?? this.isOrganization,
      contactPerson: contactPerson ?? this.contactPerson,
      mobile: mobile ?? this.mobile,
      alternateContact: alternateContact ?? this.alternateContact,
      farmCapacity: farmCapacity ?? this.farmCapacity,
      faxNo: faxNo ?? this.faxNo,
      divisionId: divisionId ?? this.divisionId,
      assignTo: assignTo ?? this.assignTo,
    );
  }
}
