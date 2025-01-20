class RolesModel {
  int? roleId;
  String? authority;

  RolesModel({this.roleId, this.authority});

  RolesModel.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleId'] = this.roleId;
    data['authority'] = this.authority;
    return data;
  }
}
