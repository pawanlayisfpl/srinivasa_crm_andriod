class CommentsResponseModel {
  final bool status;
  final String message;

  CommentsResponseModel({
    required this.status,
    required this.message,
  });

  factory CommentsResponseModel.fromJson(Map<String, dynamic> json) {
    return CommentsResponseModel(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}