import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import '../../../../../src/core/model/model.dart';
import '../../../../domain/model/zone_model.dart';

abstract class ZoneRemoteDataSource {
  Future<List<ZoneModel>> getAllZones();
}


@Injectable(as: ZoneRemoteDataSource)
class ZoneRemoteDatasourceImpl implements ZoneRemoteDataSource {
final DioClient dioClient;
final InternetChecker internetChecker;
final KeyValueStorage keyValueStorage;

  ZoneRemoteDatasourceImpl({required this.dioClient, required this.internetChecker, required this.keyValueStorage});
  
  @override
  Future<List<ZoneModel>> getAllZones() async {
   final isAvailable = await internetChecker.hasInternet();

   if(isAvailable) {
    try {
      final response = await dioClient.get(Endpoints.getAllZones,headers: {});

      if(response.statusCode == 200) {
        final List data = response.data;
        final List<ZoneModel> zones = data.map((e) => ZoneModel.fromJson(e)).toList();
        return await Future.value(zones);

      }else {
        throw Future.error(NetworkExceptions.getDioException(response.data));
      
      }
      
    } on DioException catch (e) {
      throw Future.error(NetworkExceptions.getDioException(e));
      
    }

   }else {
      throw Future.error(const NetworkExceptions.noInternetConnection());
   }
  }
}