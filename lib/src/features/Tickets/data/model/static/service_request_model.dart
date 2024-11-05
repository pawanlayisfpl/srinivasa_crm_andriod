class ServiceRequestModel {
  final int id;
  final String name;

  ServiceRequestModel({required this.id, required this.name});
}

List<ServiceRequestModel> serviceRequestModel = [
  ServiceRequestModel(id: 1, name: "Application Bug"),
  ServiceRequestModel(id: 2, name: "Feature Request"),
  ServiceRequestModel(id: 3, name: "Data issue"),
];