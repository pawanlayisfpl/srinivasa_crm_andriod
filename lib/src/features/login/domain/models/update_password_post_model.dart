
class UpdatePassPostModel {
  final String oldPassword;
  final String newPassword;

  UpdatePassPostModel({required this.oldPassword, required this.newPassword});

  Map<String, dynamic> toJson() {
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    };
  }

  factory UpdatePassPostModel.fromJson(Map<String, dynamic> json) {
    return UpdatePassPostModel(
      oldPassword: json['oldPassword'],
      newPassword: json['newPassword'],
    );
  }
}