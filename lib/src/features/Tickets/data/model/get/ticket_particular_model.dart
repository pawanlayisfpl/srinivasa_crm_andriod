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
   String? assginedUserName;
  String? assignedUserId;
  List<String>? images;

  ViewParticularTicketModel(
      {this.ticketId,
      this.description,
      this.createdDate,
      this.priority,
      this.statusDTO,
      this.serviceRequestTypeDTO,
      this.comments,
      this.createdBy,
      this.assignedTo,
            this.assginedUserName,
      this.assignedUserId,
      this.images,
      
      });

  ViewParticularTicketModel.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticketId'];
    description = json['description'];
    createdDate = json['createdDate'];
    priority = json['priority'] != null
        ? Priority.fromJson(json['priority'])
        : null;
    statusDTO = json['statusDTO'] != null
        ? StatusDTO.fromJson(json['statusDTO'])
        : null;
    serviceRequestTypeDTO = json['serviceRequestTypeDTO'] != null
        ? ServiceRequestTypeDTO.fromJson(json['serviceRequestTypeDTO'])
        : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    createdBy =
        json['createdBy'] != null ? User.fromJson(json['createdBy']) : null;
    assignedTo = json['assignedTo'] != null
        ? AssignedTo.fromJson(json['assignedTo'])
        : null;

      assginedUserName = json["assignedTo"] != null ? json['assignedTo']['assignedToUserName']  : null;
      assignedUserId = json["assignedTo"] != null ? json['assignedTo']['assignedToUserId'].toString()  : null;

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
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    if (createdBy != null) {
      data['createdBy'] = createdBy!.toJson();
    }
    if (assignedTo != null) {
      data['assignedTo'] = assignedTo!.toJson();
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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

class AssignedTo {
  int? assignedToUserId;
  String? assignedToUserName;

  AssignedTo({this.assignedToUserId, this.assignedToUserName});

  AssignedTo.fromJson(Map<String, dynamic> json) {
    assignedToUserId = json['assignedToUserId'];
    assignedToUserName = json['assignedToUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assignedToUserId'] = assignedToUserId;
    data['assignedToUserName'] = assignedToUserName;
    return data;
  }
}