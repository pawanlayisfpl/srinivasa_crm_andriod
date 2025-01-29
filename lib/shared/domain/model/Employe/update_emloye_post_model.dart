class UpdateEmployeePostModel {
  String username;
  String contactNo;
  String gender;
  String state;
  String city;
  String pincode;
  List<int> roleIds;
  int divisionId;
  List<String> zoneIds;
  int reportingTo;
  String joiningDate;
  String userId;

  // Constructor
  UpdateEmployeePostModel({
    required this.username,
    required this.contactNo,
    required this.gender,
    required this.state,
    required this.city,
    required this.pincode,
    required this.roleIds,
    required this.divisionId,
    required this.zoneIds,
    required this.reportingTo,
    required this.joiningDate,
    required this.userId,
  });

  // To convert a map (e.g. from JSON) into an UpdateEmployeePostModel
  factory UpdateEmployeePostModel.fromMap(Map<String, dynamic> map) {
    return UpdateEmployeePostModel(
      username: map['username'],
      contactNo: map['contactNo'],
      gender: map['gender'],
      state: map['state'],
      city: map['city'],
      pincode: map['pincode'],
      roleIds: List<int>.from(map['roleIds']),
      divisionId: map['divisionId'],
      zoneIds: List<String>.from(map['zoneIds']),
      reportingTo: map['reportingTo'],
      joiningDate: map['joiningDate'], userId: '',
    );
  }

  // To convert an UpdateEmployeePostModel to a map (e.g. for JSON encoding)
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'contactNo': contactNo,
      'gender': gender,
      'state': state,
      'city': city,
      'pincode': pincode,
      'roleIds': roleIds,
      'divisionId': divisionId,
      'zoneIds': zoneIds,
      'reportingTo': reportingTo,
      'joiningDate': joiningDate,
    };
  }

  // Optional: toString method for easier debugging
  @override
  String toString() {
    return 'UpdateEmployeePostModel(username: $username, contactNo: $contactNo, gender: $gender, '
        'state: $state, city: $city, pincode: $pincode, roleIds: $roleIds, divisionId: $divisionId, '
        'zoneIds: $zoneIds, reportingTo: $reportingTo, joiningDate: $joiningDate)';
  }
}
