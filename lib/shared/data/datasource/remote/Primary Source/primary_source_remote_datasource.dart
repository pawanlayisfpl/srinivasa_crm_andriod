import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../../domain/model/Primary Source/primary_source_model.dart';

abstract class PrimarySourceRemoteDataSource {
  Future<List<PrimarySourceModel>> getPrimarySources();
}



@Injectable(as: PrimarySourceRemoteDataSource)
class PrimarySourceRemoteDataSourceImpl implements PrimarySourceRemoteDataSource {
final InternetChecker internetChecker;
final DioClient dioClient;
final Logger logger;

  PrimarySourceRemoteDataSourceImpl({required this.internetChecker, required this.dioClient, required this.logger});
  
  @override
  Future<List<PrimarySourceModel>> getPrimarySources() async  {
    try {
      final response  = await dioClient.get(Endpoints.alertMarkAsRead,headers: {});

      if(response.statusCode == 200) {
        final List<PrimarySourceModel> primarySourceList = [];
        response.data.forEach((element) {
          primarySourceList.add(PrimarySourceModel.fromJson(element));
        });
        return await Future.value(primarySourceList);

      }else {
        throw Future.error(NetworkExceptions.getDioException(response.data));
      }
      
    }on DioException catch (e) {

        throw Future.error(NetworkExceptions.getDioException(e));
      
    }
  }


}