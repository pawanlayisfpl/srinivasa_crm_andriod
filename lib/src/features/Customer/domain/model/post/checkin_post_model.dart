class CheckinPostModel {
  List<int>? userIds;
  String? inTime;
  int? customerCode;
  String? customerName;
  String? langitude;
  String? latitude;
  String? remarks;

  CheckinPostModel(
      {this.userIds,
      this.inTime,
      this.customerCode,
      this.customerName,
      this.langitude,
      this.latitude,
      this.remarks});

 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userIds'] = userIds;
    data['inTime'] = inTime;
    data['customerCode'] = customerCode;
    data['customerName'] = customerName;
    data['langitude'] = langitude;
    data['latitude'] = latitude;
    data['remarks'] = remarks;
    return data;
  }
}
