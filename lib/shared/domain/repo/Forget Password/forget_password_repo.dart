import 'package:dartz/dartz.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network%20exception.dart';

class FindEmailPostModel {
  final String email;

  FindEmailPostModel({required this.email});
}

class FindEmailResponseModel {
  bool? status;
  String? message;

  FindEmailResponseModel({this.status, this.message});

  FindEmailResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class ResetPassPostModel {
  String? email;
  String? otp;
  String? newPassword;

  ResetPassPostModel({this.email, this.otp, this.newPassword});

  ResetPassPostModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    otp = json['otp'];
    newPassword = json['newPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['otp'] = otp;
    data['newPassword'] = newPassword;
    return data;
  }
}

class ResetPassResponseModel {
  bool? status;
  String? message;

  ResetPassResponseModel({this.status, this.message});

  ResetPassResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}




abstract class ForgetPasswordRepo {

  Future<Either<NetworkExceptions,FindEmailResponseModel>> findEmail({required FindEmailPostModel findEmailPostModel});
  Future<Either<NetworkExceptions,ResetPassResponseModel>> resetPass({required ResetPassPostModel resetPassPostModel});  
 

  

}