class TicketCreatePostModel {
  final String description;
  final int priorityId;
  final int serviceRequestTypeId;

  TicketCreatePostModel({
    required this.description,
    required this.priorityId,
    required this.serviceRequestTypeId,
  });

  // Convert a TicketCreatePostModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'priorityId': priorityId,
      'serviceRequestTypeId': serviceRequestTypeId,
    };
  }

  // Optional: Convert JSON to a TicketCreatePostModel instance
  factory TicketCreatePostModel.fromJson(Map<String, dynamic> json) {
    return TicketCreatePostModel(
      description: json['description'],
      priorityId: json['priorityId'],
      serviceRequestTypeId: json['serviceRequestTypeId'],
    );
  }
}
