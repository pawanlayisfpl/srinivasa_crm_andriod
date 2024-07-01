import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../../domain/model/Purpose/purpose_model.dart';

abstract class PurposeRemoteDatasource {
  Future<List<PurposeModel>> getAllPurpose();
}


@Injectable(as: PurposeRemoteDatasource)
class PurposeRemoteDatasourceImpl implements PurposeRemoteDatasource {
  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final InternetChecker internetChecker;

  PurposeRemoteDatasourceImpl({required this.dioClient, required this.keyValueStorage, required this.internetChecker});
  
  @override
  Future<List<PurposeModel>> getAllPurpose()  async {
    try {
    final response = await dioClient.get(Endpoints.allPurposes, headers: {});

    if(response.statusCode == 200) {
      final List data = response.data;
      final purposeList = data.map((e) => PurposeModel.fromJson(e)).toList();
      return Future.value(purposeList);
    } else {
      throw NetworkExceptions.getException(response.data);
    }
  } on DioException catch (e) {
    throw NetworkExceptions.getDioException(e);
  }
  }
}