class PrimarySourceModel {
  final int sourceId;
  final String sourceName;

  PrimarySourceModel({required this.sourceId, required this.sourceName});

  factory PrimarySourceModel.fromJson(Map<String, dynamic> json) {
    return PrimarySourceModel(
      sourceId: json['sourceId'],
      sourceName: json['sourceName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sourceId': sourceId,
      'sourceName': sourceName,
    };
  }
}