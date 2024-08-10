import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network%20exception.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/kyc_upload_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/post/kyc_upload_post_model.dart';

import '../../domain/model/customer_kyu_model.dart';
import '../../domain/repo/kyc_repo.dart';
import '../datasource/remote/kyc_remote_datasource.dart';

@Injectable(as: KycRepo)
class KycRepoImpl implements KycRepo {
  final KycRemoteDataSource kycRemoteDataSource;

  KycRepoImpl({required this.kycRemoteDataSource});

@override
Future<Either<NetworkExceptions, List<CustomerKycModel>>> getPendingKyuCustomers() async {
  try {
    final results = await kycRemoteDataSource.getPendingKyuCustomers();
    return Right(results); // Use Right for success
    
  } on NetworkExceptions catch (e) {
    return Left(e); // Use Left for errors
    
  }
}

  @override
  Future<Either<NetworkExceptions, KycUploadResponseModel>> uploadKycDetails({required KycUploadPostModel kycUploadPostModel}) async {
    try {
      final results = await kycRemoteDataSource.uploadKycDetails(kycUploadPostModel: kycUploadPostModel);
      return Right(results);
      
    } on DioException catch (e) {
      return Left(NetworkExceptions.getDioException(e));
      
    }
  }
}