import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
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
    logger.d('KYC API STARTED');
    try {
      final response = await dioClient.get(Endpoints.getPendingKycCustomers, headers: {
      });

      if(response.statusCode == 200){
        final List data = response.data['data'];
        return await Future.value(data.map((e) => CustomerKycModel.fromJson(e)).toList());
      }else {
        logger.e('KYC API FAILED');
        throw NetworkExceptions.getDioException(response.data);
      }
    }on DioException catch (e) {
      logger.e('KYC API FAILED');
      throw NetworkExceptions.getDioException(e); 
    }
  }
  @override
Future<KycUploadResponseModel> uploadKycDetails({required KycUploadPostModel kycUploadPostModel}) async {

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

