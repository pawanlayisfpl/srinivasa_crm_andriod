class CommentPostModel {
  final String commentText;
  final String id;

  CommentPostModel({required this.commentText,required this.id});

  factory CommentPostModel.fromJson(Map<String, dynamic> json) {
    return CommentPostModel(
      id: json['id'],
      commentText: json['commentText'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'commentText': commentText,
    };
  }
}