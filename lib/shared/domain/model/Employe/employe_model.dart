class EmployeeModel {
  int? id;
  String? userName;
  List<String>? designation;

  EmployeeModel({this.id, this.userName, this.designation});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    designation = json['designation'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['designation'] = this.designation;
    return data;
  }
}
