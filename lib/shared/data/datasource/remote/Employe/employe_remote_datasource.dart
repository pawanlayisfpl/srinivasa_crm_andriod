// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_model.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../../../../src/core/model/model.dart';

abstract class EmployeDataSource{
  Future<List<EmployeeModel>> getEmployesList();
}


@Injectable(as: EmployeDataSource)
class EmployeRemoteDatasourceImpl implements EmployeDataSource {

  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final InternetChecker internetChecker;
  final Logger logger;

  EmployeRemoteDatasourceImpl({
    required this.dioClient,
    required this.keyValueStorage,
    required this.internetChecker,
    required this.logger,
  });
  
  @override
  Future<List<EmployeeModel>> getEmployesList() async {
    logger.d('EMPLOYE API STARTED');
    final results = await internetChecker.isConnected();

    if(results) {

logger.d('EMPLOYE API CALL MADE THROUGH INTERNET');
      try {
        final response = await dioClient.get(Endpoints.allEmployess,headers: {},);

        if(response.statusCode == 200) {
          logger.d('EMPLOYE API SUCCESS');
          final List data = response.data;
          


          return data.map((e) => EmployeeModel.fromJson(e)).toList();

        }else {
          logger.e('EMPLYEE API FAILED');
          throw NetworkExceptions.getDioException(response.data);
        }
        
      } catch (e) {
        logger.e('EMPLYEE API FAILED');
        if(e is DioException) {
        logger.e(e.response != null ? e.response!.data : e.message);

          throw NetworkExceptions.getDioException(e);
        }else {
          throw const NetworkExceptions.badRequest();
        }
        
      }

    }else {

      throw const NetworkExceptions.noInternetConnection();
    }
  }

}
