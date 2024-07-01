class AlertCountModel {
  int? count;

  AlertCountModel({this.count});

  AlertCountModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // ignore: unnecessary_this
    data['count'] = this.count;
    return data;
  }
}
