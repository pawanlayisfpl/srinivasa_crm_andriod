import 'dart:typed_data';

class TicketCreatePostModel {
  final String description;
  final int priorityId;
  final int serviceRequestTypeId;
    List<Uint8List>? images;

  TicketCreatePostModel({
    required this.description,
    required this.priorityId,
    required this.serviceRequestTypeId,
    this.images,
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
