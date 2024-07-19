import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/domain/model/customer_kyu_model.dart';

import '../../../../../core/model/network exception/network exception.dart';

abstract class KycRemoteDataSource {
  Future<List<CustomerKycModel>> getPendingKyuCustomers();

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
        final List data = response.data;
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

}