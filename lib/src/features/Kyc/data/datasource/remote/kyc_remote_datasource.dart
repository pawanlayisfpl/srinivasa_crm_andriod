import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/src/config/constants/appconfig.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/database/kyc_database.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/customer_kyu_model.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/kyc_upload_response_model.dart';

import '../../../../../core/model/network exception/network exception.dart';
import '../../../domain/model/post/kyc_upload_post_model.dart';

abstract class KycRemoteDataSource {
  Future<List<CustomerKycModel>> getPendingKyuCustomers();
  Future<KycUploadResponseModel> uploadKycDetails({required KycUploadPostModel kycUploadPostModel});

}


@Injectable(as : KycRemoteDataSource)
class KycRemoteDatasourceImpl implements KycRemoteDataSource {
  final DioClient dioClient;
  final InternetChecker internetChecker;
  final Logger logger;
  final KeyValueStorage keyValueStorage;

  KycRemoteDatasourceImpl({required this.dioClient, required this.internetChecker, required this.logger, required this.keyValueStorage});
  
  @override
  Future<List<CustomerKycModel>> getPendingKyuCustomers() async {
    final results = await internetChecker.hasInternet();
    final databse = KycDatabase();
    // TODO: REMOVE (!) FROM RESULTS
    if(results) {
      // INTERNET AVAILABLE
      debugPrint('KYC API STARTED');
    try {
      final response = await dioClient.get(Endpoints.getPendingKycCustomers, headers: {
      });

      if(response.statusCode == 200){
        final List data = response.data['data'];
        for(var i in data){
          await databse.insertCustomerKyc(CustomerKycModel.fromJson(i));
        }
        
        return await Future.value(data.map((e) => CustomerKycModel.fromJson(e)).toList());
      }else {
        debugPrint('KYC API FAILED');
        throw NetworkExceptions.getDioException(response.data);
      }
    }on DioException catch (e) {
      debugPrint('KYC API FAILED');
      throw NetworkExceptions.getDioException(e); 
    }

    }else {
      if(AppConfig.isOfflineEnabled) {
          

      // NO INTERNET
      List<CustomerKycModel> kycList = await databse.getCustomerKycs();
      return kycList;

      }else {
        // NO INTERNET
        throw const NetworkExceptions.noInternetConnection();
      }
    }
    
  }
  @override
Future<KycUploadResponseModel> uploadKycDetails({required KycUploadPostModel kycUploadPostModel}) async {
  final results = await internetChecker.hasInternet();

  if (results) {
    // INTERNET AVAILABLE
  }else {
  // NO INTERNET
    throw const NetworkExceptions.noInternetConnection();
  }

  List<MultipartFile> aadharFiles = []; 

  if (kycUploadPostModel.aadharFile != null) {
    aadharFiles.add( MultipartFile.fromBytes(kycUploadPostModel.aadharFile!.imageByes,filename: kycUploadPostModel.aadharFile!.name));
  }

  if (kycUploadPostModel.aadharFileBack != null) {
    aadharFiles.add( MultipartFile.fromBytes(kycUploadPostModel.aadharFileBack!.imageByes,filename: kycUploadPostModel.aadharFileBack!.name));
  }

  FormData data = FormData.fromMap({
    'customerId': kycUploadPostModel.customerId,
    'aadharId': kycUploadPostModel.aadharid,
    'panCardId': kycUploadPostModel.panCardId,
    'gstInNo': kycUploadPostModel.gstInNo,
    'panCardFile': kycUploadPostModel.panCardFile != null ?  MultipartFile.fromBytes(kycUploadPostModel.panCardFile!.imageByes,filename:  kycUploadPostModel.panCardFile!.name) : null,
    'aadharFile': aadharFiles.isNotEmpty ? aadharFiles : null,
    'gstInFile': kycUploadPostModel.gstInFile != null ? MultipartFile.fromBytes(kycUploadPostModel.gstInFile!.imageByes,filename:  kycUploadPostModel.gstInFile!.name) : null,
    'remarks': kycUploadPostModel.remarks,
  });

  try {
    final response = await dioClient.post(Endpoints.uploadKycUrl, data: data, headers:  {});
    
    if (response.statusCode == 201) {
      return KycUploadResponseModel(message: "KYC Uploaded Successfully", status: "true");
    } else {
      throw NetworkExceptions.getDioException(response.data);
    }
  } on DioException catch (e) {
    // Log or handle the error here
    throw NetworkExceptions.getDioException(e);
  }
}
  }

