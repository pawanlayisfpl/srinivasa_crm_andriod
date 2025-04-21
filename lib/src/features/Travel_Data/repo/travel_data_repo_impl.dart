import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network%20exception.dart'; 
import '../model/traveldatamodel.dart'; 

abstract class TravelDataRepo {
   Future<Either<NetworkExceptions,TravelDataModel>> getTravelData() ;  
}

@Injectable(as: TravelDataRepo)
class TicketsRepoImpl implements TravelDataRepo {
  final DioClient dioClient;
  final KeyValueStorage keyValueStorage;
  final InternetChecker internetChecker;

  TicketsRepoImpl({required this.dioClient, required this.keyValueStorage, required this.internetChecker});
  
   @override
  Future<Either<NetworkExceptions, TravelDataModel>> getTravelData() async  {

    final status = await internetChecker.hasInternet();
    if(status) {
      try { 
        final response = await dioClient.get('${Endpoints.getTravelData}?startDate=2025-03-01&endDate=2025-03-10}',headers: {});
        if(response.statusCode == 200) {
          TravelDataModel travelDataResponseModel = TravelDataModel.fromJson(response.data);
          return right(travelDataResponseModel);
        }
        else {
          return left(NetworkExceptions.getDioException(response.data));
        }
      } on DioException catch (e) {
        return left(NetworkExceptions.getDioException(e));
      }
    }else {
      return left(const NetworkExceptions.noInternetConnection());
    }
  }
}