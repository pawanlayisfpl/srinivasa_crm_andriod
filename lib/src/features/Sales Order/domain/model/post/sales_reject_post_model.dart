class SalesRejectPostModel {
  String orderId;
  String comments;

  SalesRejectPostModel({required this.orderId, required this.comments});

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'comments': comments,
    };
  }
}