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
    if (repPunchIn != null) {
      data['repPunchIn'] = repPunchIn!.toJson();
    }
    if (repPunchOut != null) {
      data['repPunchOut'] = repPunchOut!.toJson();
    }
    if (repTravelLogsData != null) {
      data['repTravelLogsData'] =
          repTravelLogsData!.map((v) => v.toJson()).toList();
    }
    data['punchedIn'] = punchedIn;
    data['punchedOut'] = punchedOut;
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
    data['punchTime'] = punchTime;
    data['punchLat'] = punchLat;
    data['punchLong'] = punchLong;
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
    data['customerId'] = customerId;
    data['customerName'] = customerName;
    data['customerAddress'] = customerAddress;
    data['checkInTime'] = checkInTime;
    data['checkOutTime'] = checkOutTime;
    data['checkInLat'] = checkInLat;
    data['checkInLong'] = checkInLong;
    data['checkOutLat'] = checkOutLat;
    data['checkOutLong'] = checkOutLong;
    return data;
  }
}
