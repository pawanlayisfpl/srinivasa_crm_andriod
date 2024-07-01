class EmployeeModel {
  int? id;
  String? userName;
  String? designation;

  EmployeeModel({this.id, this.userName, this.designation});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['designation'] = designation;
    return data;
  }
}
