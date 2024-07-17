import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/shared/domain/model/City/city_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Country/country_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Locality/locality_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/StateModel/state_model.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../../domain/model/District/district_model.dart';

abstract class AddressRemoteDataSource {
  Future<List<CountryModel>> getCountries();
  Future<List<StateModel>> getStateByCountry({required String countryId});
  Future<List<DistrictModel>> getDistrictByStateId({required String stateId});
  Future<List<CityModel>> getCityByStateId({required StateModel statemodel});
  Future<List<LocalityModel>> getLocaliltyByCityId({required CityModel cityModel});

}



@Injectable(as:  AddressRemoteDataSource)
class AddressRemoteDatasourceImpl implements AddressRemoteDataSource {
  final InternetChecker internetConnectionChecker;
  final DioClient dioClient;
  final Logger logger;

  AddressRemoteDatasourceImpl({required this.internetConnectionChecker, required this.dioClient, required this.logger});
  
  @override
  Future<List<CountryModel>> getCountries() async {
   logger.d('COUNTIRES API STARTED');
   try {
      final response = await dioClient.get(Endpoints.countires,headers:  {});

    if(response.statusCode == 200){
      final List<CountryModel> countries = (response.data as List).map((e) => CountryModel.fromJson(e)).toList();
      return await Future.value(countries);
    }else {
      logger.e('COUNTRY API FAIELD');
      throw Future.error(NetworkExceptions.getDioException(response.data));
    }

     
   }on DioException catch (e) {
          logger.e('COUNTRY API FAIELD');

    throw Future.error(NetworkExceptions.getDioException(e));
     
   }
  }
  
  @override
  Future<List<DistrictModel>> getDistrictByStateId({required String stateId}) async {
    logger.d('DIVISION API STARTED');
    try {
        final response = await dioClient.post(Endpoints.districts,headers:  {},data: {
          "stateId" : stateId
        });
  
      if(response.statusCode == 200){
        final List<DistrictModel> states = (response.data as List).map((e) => DistrictModel.fromJson(e)).toList();
        return await Future.value(states);
      }else {
        logger.e('DIVISION API FAIELD');
        throw Future.error(NetworkExceptions.getDioException(response.data));
      }
  
      
    }on DioException catch (e) {
            logger.e('DIVISION API FAIELD');
  
      throw Future.error(NetworkExceptions.getDioException(e));
      
    }

  }
  
  @override
  Future<List<StateModel>> getStateByCountry({required String countryId}) async {
   logger.d('STATE API STARTED');
   try {
      final response = await dioClient.get(Endpoints.states,headers:  {});

    if(response.statusCode == 200){
      final List<StateModel> states = (response.data as List).map((e) => StateModel.fromJson(e)).toList();
      return await Future.value(states);
    }else {
      logger.e('STATE API FAIELD');
      throw Future.error(NetworkExceptions.getDioException(response.data));
    }

     
   }on DioException catch (e) {
          logger.e('STATE API FAIELD');

    throw Future.error(NetworkExceptions.getDioException(e));
     
   }
  }
  
  @override
  Future<List<CityModel>> getCityByStateId({required StateModel statemodel}) async {
    logger.d('CITY API STARTED');
    try {
        final response = await dioClient.post(Endpoints.getCityByStateId,headers:  {},data: {
          "stateId" : statemodel.stateId
        });
  
      if(response.statusCode == 200){
        final List<CityModel> cities = (response.data as List).map((e) => CityModel.fromJson(e)).toList();
        return  cities;
      }else {
        logger.e('CITY API FAIELD');
        throw NetworkExceptions.getDioException(response.data);
      }
  
      
    }on DioException catch (e) {
            logger.e('CITY API FAIELD');
  
      throw NetworkExceptions.getDioException(e);
      
    }
  }
  
  @override
  Future<List<LocalityModel>> getLocaliltyByCityId({required CityModel cityModel}) async {
    logger.d('LOCALITY API STARTED');
    try {
        final response = await dioClient.post(Endpoints.getLocalitiesByCity,headers:  {},data: {
          "cityId" : cityModel.cityId
        });
  
      if(response.statusCode == 200){
        final List<LocalityModel> localities = (response.data as List).map((e) => LocalityModel.fromJson(e)).toList();
        return  localities;
      }else {
        logger.e('LOCALITY API FAIELD');
        throw NetworkExceptions.getDioException(response.data);
      }
  
      
    }on DioException catch (e) {
            logger.e('LOCALITY API FAIELD');
  
      throw NetworkExceptions.getDioException(e);
      
    }
  }
}