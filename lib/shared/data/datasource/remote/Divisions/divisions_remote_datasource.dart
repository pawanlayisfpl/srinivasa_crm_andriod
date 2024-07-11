import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../../../../src/core/model/network exception/network exception.dart';
import '../../../../domain/model/Division/division_model.dart';

abstract class DivisonsRemoteDataSource {
  Future<List<DivisionModel>> getDivisions();
}

@Injectable(as: DivisonsRemoteDataSource)
class DivisionsRemoteDatasourceImpl implements DivisonsRemoteDataSource {
  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final InternetChecker internetChecker;

  DivisionsRemoteDatasourceImpl({required this.dioClient, required this.keyValueStorage, required this.internetChecker});
  
  @override
  Future<List<DivisionModel>> getDivisions() async {
    try {
      final response = await dioClient.get(Endpoints.getAllDivisions,headers: {});

      if(response.statusCode == 200) {
      final List<DivisionModel> divisions = (response.data as List).map((e) => DivisionModel.fromJson(e)).toList();

        return  Future.value(divisions);

      }else {
        return Future.error(NetworkExceptions.getException(response.data));

      }
    } on DioException catch (e) {
      throw Future.error(NetworkExceptions.getDioException(e));
    }
  }

}