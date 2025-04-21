class VechileItemsModel {
  final int id;
  final String name;

  VechileItemsModel({required this.id, required this.name});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VechileItemsModel && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
