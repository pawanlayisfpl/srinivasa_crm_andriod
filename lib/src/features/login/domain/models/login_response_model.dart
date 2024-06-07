class LoginResponseModel {
  User? user;
  String? jwt;

  LoginResponseModel({this.user, this.jwt});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    jwt = json['jwt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['jwt'] = jwt;
    return data;
  }
}

class User {
  int? id;
  int? roleId;
  int? divisionId;
  String? email;
  List<Authorities>? authorities;
  List<Zones>? zones;

  User(
      {this.id,
      this.roleId,
      this.divisionId,
      this.email,
      this.authorities,
      this.zones});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['roleId'];
    divisionId = json['divisionId'];
    email = json['email'];
    if (json['authorities'] != null) {
      authorities = <Authorities>[];
      json['authorities'].forEach((v) {
        authorities!.add(Authorities.fromJson(v));
      });
    }
    if (json['zones'] != null) {
      zones = <Zones>[];
      json['zones'].forEach((v) {
        zones!.add(Zones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['roleId'] = roleId;
    data['divisionId'] = divisionId;
    data['email'] = email;
    if (authorities != null) {
      data['authorities'] = authorities!.map((v) => v.toJson()).toList();
    }
    if (zones != null) {
      data['zones'] = zones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Authorities {
  int? roleId;
  String? authority;

  Authorities({this.roleId, this.authority});

  Authorities.fromJson(Map<String, dynamic> json) {
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

class Zones {
  String? id;
  String? zoneName;

  Zones({this.id, this.zoneName});

  Zones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zoneName = json['zoneName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['zoneName'] = zoneName;
    return data;
  }
}
