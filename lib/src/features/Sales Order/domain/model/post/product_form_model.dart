// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/product_model.dart';

class ProductFormModel {
  final String id;
  final ProductsModel? productsModel;
  final int divisionId;
  final int productId;
  final int quanity;
  final double rate;
  final double? discountPerQty;
  final double? discountPerPercentage;
  final double totalAmount;
  final double? gstAmount;
  final double? sellingRate;
  final int uomId;
  final int quanitiyToDeliver;
  final String shipmentDate;
  final String chDate;

  ProductFormModel({
    required this.id,
    this.productsModel,
    required this.divisionId,
    required this.productId,
    required this.quanity,
    required this.rate,
    this.discountPerQty,
    this.discountPerPercentage,
    required this.totalAmount,
    this.gstAmount,
    this.sellingRate,
    required this.uomId,
    required this.quanitiyToDeliver,
    required this.shipmentDate,
    required this.chDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productsModel': productsModel?.toJson(), // Handle null case
      'divisionId': divisionId,
      'productId': productId,
      'quanity': quanity,
      'rate': rate,
      'discountPerQty': discountPerQty,
      'discountPerPercentage': discountPerPercentage,
      'totalAmount': totalAmount,
      'gstAmount': gstAmount,
      'sellingRate': sellingRate,
      'uomId': uomId,
      'quanitiyToDeliver': quanitiyToDeliver,
      'shipmentDate': shipmentDate,
      'chDate': chDate,
    };
  }
}
