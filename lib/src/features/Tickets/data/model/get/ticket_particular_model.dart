class ViewParticularTicketModel {
  int? ticketId;
  String? description;
  String? createdDate;
  Priority? priority;
  StatusDTO? statusDTO;
  ServiceRequestTypeDTO? serviceRequestTypeDTO;
  List<Comments>? comments;
  User? createdBy;
  AssignedTo? assignedTo;

  ViewParticularTicketModel(
      {this.ticketId,
      this.description,
      this.createdDate,
      this.priority,
      this.statusDTO,
      this.serviceRequestTypeDTO,
      this.comments,
      this.createdBy,
      this.assignedTo});

  ViewParticularTicketModel.fromJson(Map<String, dynamic> json) {
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
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    createdBy =
        json['createdBy'] != null ? new User.fromJson(json['createdBy']) : null;
    assignedTo = json['assignedTo'] != null
        ? new AssignedTo.fromJson(json['assignedTo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticketId'] = this.ticketId;
    data['description'] = this.description;
    data['createdDate'] = this.createdDate;
    if (this.priority != null) {
      data['priority'] = this.priority!.toJson();
    }
    if (this.statusDTO != null) {
      data['statusDTO'] = this.statusDTO!.toJson();
    }
    if (this.serviceRequestTypeDTO != null) {
      data['serviceRequestTypeDTO'] = this.serviceRequestTypeDTO!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    if (this.assignedTo != null) {
      data['assignedTo'] = this.assignedTo!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['priorityId'] = this.priorityId;
    data['priorityName'] = this.priorityName;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusId'] = this.statusId;
    data['statusName'] = this.statusName;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceRequestTypeId'] = this.serviceRequestTypeId;
    data['serviceRequestTypeName'] = this.serviceRequestTypeName;
    return data;
  }
}

class Comments {
  int? commentId;
  String? commentText;
  String? created;
  User? user;

  Comments({this.commentId, this.commentText, this.created, this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'];
    commentText = json['commentText'];
    created = json['created'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentId'] = this.commentId;
    data['commentText'] = this.commentText;
    data['created'] = this.created;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    return data;
  }
}

class AssignedTo {
  int? assignedToUserId;
  String? assignedToUserName;

  AssignedTo({this.assignedToUserId, this.assignedToUserName});

  AssignedTo.fromJson(Map<String, dynamic> json) {
    assignedToUserId = json['assignedToUserId'];
    assignedToUserName = json['assignedToUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assignedToUserId'] = this.assignedToUserId;
    data['assignedToUserName'] = this.assignedToUserName;
    return data;
  }
}