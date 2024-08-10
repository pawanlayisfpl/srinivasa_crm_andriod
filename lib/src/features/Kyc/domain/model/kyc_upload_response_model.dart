class KycUploadResponseModel {
  final String? message;
  final String? status;

  KycUploadResponseModel({this.message, this.status});

  factory KycUploadResponseModel.fromJson(Map<String, dynamic> json) {
    return KycUploadResponseModel(
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
    };
  }
}