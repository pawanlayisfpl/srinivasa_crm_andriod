class CheckinPostModel {
  List<int>? userIds;
  String? inTime;
  int? customerid;
  String? customerName;
  String? langitude;
  String? latitude;
  String? remarks;
  String? farmId;

  CheckinPostModel(
      {this.userIds,
      this.inTime,
      this.customerid,
      this.customerName,
      this.langitude,
      this.latitude,
      this.farmId,
      this.remarks});

 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userIds'] = userIds;
    data['inTime'] = inTime;
    data['customerId'] = customerid;
    data['customerName'] = customerName;
    data['langitude'] = langitude;
    data['latitude'] = latitude;
    data['remarks'] = remarks;
    data['farmId'] = farmId;
    return data;
  }
}
