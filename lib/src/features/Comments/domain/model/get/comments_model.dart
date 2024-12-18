// ignore_for_file: unnecessary_new

class CommentsModel {
  int? commentId;
  String? commentText;
  String? created;
  User? user;

  CommentsModel({this.commentId, this.commentText, this.created, this.user});

  CommentsModel.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'];
    commentText = json['commentText'];
    created = json['created'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['commentId'] = commentId;
    data['commentText'] = commentText;
    data['created'] = created;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? userId;
  String? userName;

  User({this.userId, this.userName});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userName'] = userName;
    return data;
  }
}
