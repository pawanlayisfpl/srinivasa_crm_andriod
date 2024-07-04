class MonthlyPlanSearchResponseModel {
  bool? status;
  String? message;
  List<MonthlyPlanSearchUserModel>? monthlyPlanSearchUserModel;

  MonthlyPlanSearchResponseModel(
      {this.status, this.message, this.monthlyPlanSearchUserModel});

  MonthlyPlanSearchResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['users'] != null) {
      monthlyPlanSearchUserModel = <MonthlyPlanSearchUserModel>[];
      json['users'].forEach((v) {
        monthlyPlanSearchUserModel!
            .add(MonthlyPlanSearchUserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (monthlyPlanSearchUserModel != null) {
      data['users'] =
          monthlyPlanSearchUserModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthlyPlanSearchUserModel {
  int? id;
  String? userName;
  List<Roles>? roles;

  MonthlyPlanSearchUserModel({this.id, this.userName, this.roles});

  MonthlyPlanSearchUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? roleId;
  String? authority;

  Roles({this.roleId, this.authority});

  Roles.fromJson(Map<String, dynamic> json) {
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
