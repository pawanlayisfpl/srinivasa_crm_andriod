// ignore_for_file: unnecessary_new

class ViewTicketResponseModel {
  List<ViewTicketModel>? data;
  bool? status;
  String? message;

  ViewTicketResponseModel({this.data, this.status, this.message});

  ViewTicketResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ViewTicketModel>[];
      json['data'].forEach((v) {
        data!.add(new ViewTicketModel.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class ViewTicketModel {
  int? ticketId;
  String? description;
  String? createdDate;
  Priority? priority;
  StatusDTO? statusDTO;
  ServiceRequestTypeDTO? serviceRequestTypeDTO;
  String? assginedUserName;
  String? assignedUserId;
  List<String>? images;

  ViewTicketModel(
      {this.ticketId,
      this.description,
      this.createdDate,
      this.priority,
      this.statusDTO,
      this.serviceRequestTypeDTO,
      this.assginedUserName,
      this.assignedUserId,
      this.images,
      });

  ViewTicketModel.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticketId'];
    description = json['description'];
    createdDate = json['createdDate'];
    priority = json['priority'] != null
        ? new Priority.fromJson(json['priority'])
        : null;
    statusDTO = json['statusDTO'] != null
        ? new StatusDTO.fromJson(json['statusDTO'])
        : null;
    serviceRequestTypeDTO = json['serviceRequestTypeDTO'] != null
        ? new ServiceRequestTypeDTO.fromJson(json['serviceRequestTypeDTO'])
        : null;

      assginedUserName = json["assignedTo"] != null ? json['assignedTo']['assignedToUserName']  : null;
      assignedUserId = json["assignedTo"] != null ? json['assignedTo']['assignedToUserId']  : null;

 images = json['imageLinks'] != null 
    ? List<String>.from(json['imageLinks']) 
    : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ticketId'] = ticketId;
    data['description'] = description;
    data['createdDate'] = createdDate;
    if (priority != null) {
      data['priority'] = priority!.toJson();
    }
    if (statusDTO != null) {
      data['statusDTO'] = statusDTO!.toJson();
    }
    if (serviceRequestTypeDTO != null) {
      data['serviceRequestTypeDTO'] = serviceRequestTypeDTO!.toJson();
    }

    if(data['assignedTo'] != null) {
      data['assignedTo']['assignedToUserName'] = assginedUserName;
      data['assignedTo']['assignedToUserId'] = assginedUserName;

    }

   


    return data;
  }
}

class Priority {
  int? priorityId;
  String? priorityName;

  Priority({this.priorityId, this.priorityName});

  Priority.fromJson(Map<String, dynamic> json) {
    priorityId = json['priorityId'];
    priorityName = json['priorityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['priorityId'] = priorityId;
    data['priorityName'] = priorityName;
    return data;
  }
}

class StatusDTO {
  int? statusId;
  String? statusName;

  StatusDTO({this.statusId, this.statusName});

  StatusDTO.fromJson(Map<String, dynamic> json) {
    statusId = json['statusId'];
    statusName = json['statusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusId'] = statusId;
    data['statusName'] = statusName;
    return data;
  }
}

class ServiceRequestTypeDTO {
  int? serviceRequestTypeId;
  String? serviceRequestTypeName;

  ServiceRequestTypeDTO(
      {this.serviceRequestTypeId, this.serviceRequestTypeName});

  ServiceRequestTypeDTO.fromJson(Map<String, dynamic> json) {
    serviceRequestTypeId = json['serviceRequestTypeId'];
    serviceRequestTypeName = json['serviceRequestTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceRequestTypeId'] = serviceRequestTypeId;
    data['serviceRequestTypeName'] = serviceRequestTypeName;
    return data;
  }
}
