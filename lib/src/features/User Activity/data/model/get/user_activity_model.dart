class UserActivityModel {
  RepPunchIn? repPunchIn;
  RepPunchIn? repPunchOut;
  List<RepTravelLogsData>? repTravelLogsData;
  bool? punchedIn;
  bool? punchedOut;

  UserActivityModel(
      {this.repPunchIn,
      this.repPunchOut,
      this.repTravelLogsData,
      this.punchedIn,
      this.punchedOut});

  UserActivityModel.fromJson(Map<String, dynamic> json) {
    repPunchIn = json['repPunchIn'] != null
        ? RepPunchIn.fromJson(json['repPunchIn'])
        : null;
    repPunchOut = json['repPunchOut'] != null
        ? RepPunchIn.fromJson(json['repPunchOut'])
        : null;
    if (json['repTravelLogsData'] != null) {
      repTravelLogsData = <RepTravelLogsData>[];
      json['repTravelLogsData'].forEach((v) {
        repTravelLogsData!.add(RepTravelLogsData.fromJson(v));
      });
    }
    punchedIn = json['punchedIn'];
    punchedOut = json['punchedOut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.repPunchIn != null) {
      data['repPunchIn'] = this.repPunchIn!.toJson();
    }
    if (this.repPunchOut != null) {
      data['repPunchOut'] = this.repPunchOut!.toJson();
    }
    if (this.repTravelLogsData != null) {
      data['repTravelLogsData'] =
          this.repTravelLogsData!.map((v) => v.toJson()).toList();
    }
    data['punchedIn'] = this.punchedIn;
    data['punchedOut'] = this.punchedOut;
    return data;
  }
}

class RepPunchIn {
  String? punchTime;
  String? punchLat;
  String? punchLong;

  RepPunchIn({this.punchTime, this.punchLat, this.punchLong});

  RepPunchIn.fromJson(Map<String, dynamic> json) {
    punchTime = json['punchTime'];
    punchLat = json['punchLat'];
    punchLong = json['punchLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['punchTime'] = this.punchTime;
    data['punchLat'] = this.punchLat;
    data['punchLong'] = this.punchLong;
    return data;
  }
}

class RepTravelLogsData {
  String? customerId;
  String? customerName;
  String? customerAddress;
  String? checkInTime;
  String? checkOutTime;
  String? checkInLat;
  String? checkInLong;
  String? checkOutLat;
  String? checkOutLong;

  RepTravelLogsData(
      {this.customerId,
      this.customerName,
      this.customerAddress,
      this.checkInTime,
      this.checkOutTime,
      this.checkInLat,
      this.checkInLong,
      this.checkOutLat,
      this.checkOutLong});

  RepTravelLogsData.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerName = json['customerName'];
    customerAddress = json['customerAddress'];
    checkInTime = json['checkInTime'];
    checkOutTime = json['checkOutTime'];
    checkInLat = json['checkInLat'];
    checkInLong = json['checkInLong'];
    checkOutLat = json['checkOutLat'];
    checkOutLong = json['checkOutLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['customerName'] = this.customerName;
    data['customerAddress'] = this.customerAddress;
    data['checkInTime'] = this.checkInTime;
    data['checkOutTime'] = this.checkOutTime;
    data['checkInLat'] = this.checkInLat;
    data['checkInLong'] = this.checkInLong;
    data['checkOutLat'] = this.checkOutLat;
    data['checkOutLong'] = this.checkOutLong;
    return data;
  }
}
