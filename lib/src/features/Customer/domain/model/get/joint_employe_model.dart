class JoinEmployeModel {
  final int id;
  final String userName;
  final List<String> designation;

  JoinEmployeModel({
    required this.id,
    required this.userName,
    required this.designation,
  });

  factory JoinEmployeModel.fromJson(Map<String, dynamic> json) {
    return JoinEmployeModel(
      id: json['id'],
      userName: json['userName'],
      designation: List<String>.from(json['designation']),
    );
  }
}