class PriceModel {
  final int? productPriceId;
  final String productName;
  final String divisionName;
  final double rate;
  final double gst;

  PriceModel({
    required this.productPriceId,
    required this.productName,
    required this.divisionName,
    required this.rate,
    required this.gst,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      productPriceId: json['productPriceId'],
      productName: json['productName'],
      divisionName: json['divisionName'],
      rate: json['rate'].toDouble(),
      gst: json['gst'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productPriceId': productPriceId,
      'productName': productName,
      'divisionName': divisionName,
      'rate': rate,
      'gst': gst,
    };
  }
}