class SalesApprovePostModel {
  String orderId;
  String comments;

  SalesApprovePostModel({required this.orderId, required this.comments});

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'comments': comments,
    };
  }
}