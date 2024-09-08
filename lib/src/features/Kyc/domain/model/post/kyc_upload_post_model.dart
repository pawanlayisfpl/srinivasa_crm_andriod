// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:file_picker/file_picker.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Image/image_model.dart';

class KycUploadPostModel {
  final String customerId;
  final String aadharid;
  final String panCardId;
  final String gstInNo;
  final ImageModel? panCardFile;
  final ImageModel? aadharFile;
  final ImageModel? aadharFileBack;
  final ImageModel? gstInFile;
  final String remarks;
  KycUploadPostModel({
    required this.customerId,
    required this.aadharid,
    required this.panCardId,
    required this.gstInNo,
    this.aadharFileBack,
    this.panCardFile,
    this.aadharFile,
    this.gstInFile,
    required this.remarks,
  });

   Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'aadharid': aadharid,
      'panCardId': panCardId,
      'gstInNo': gstInNo,
      
      'remarks': remarks,
    };
  }


     factory KycUploadPostModel.fromJson(Map<String, dynamic> json) {
    return KycUploadPostModel(
      customerId: json['customerId'],
      aadharid: json['aadharid'],
      panCardId: json['panCardId'],
      gstInNo: json['gstInNo'],
      panCardFile: json['panCardFile'] != null ? ImageModel.fromJson(json['panCardFile']) : null,
      aadharFile: json['aadharFile'] != null ? ImageModel.fromJson(json['aadharFile']) : null,
      aadharFileBack: json['aadharFileBack'] != null ? ImageModel.fromJson(json['aadharFileBack']) : null,
      gstInFile: json['gstInFile'] != null ? ImageModel.fromJson(json['gstInFile']) : null,
      remarks: json['remarks'],
    );
  }

  
}
