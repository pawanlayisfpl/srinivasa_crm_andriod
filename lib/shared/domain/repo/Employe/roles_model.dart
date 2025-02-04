class RolesModel {
  int? roleId;
  String? authority;

  RolesModel({this.roleId, this.authority});

  RolesModel.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roleId'] = roleId;
    data['authority'] = authority;
    return data;
  }
}
