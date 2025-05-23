import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:srinivasa_crm_new/shared/domain/model/City/city_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Country/country_model.dart';
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
   debugPrint('COUNTIRES API STARTED');
   try {
      final response = await dioClient.get(Endpoints.countires,headers:  {});

    if(response.statusCode == 200){
      final List<CountryModel> countries = (response.data["data"] as List).map((e) => CountryModel.fromJson(e)).toList();
      return await Future.value(countries);
    }else {
      debugPrint('COUNTRY API FAIELD');
      throw Future.error(NetworkExceptions.getDioException(response.data));
    }

     
   }on DioException catch (e) {
          debugPrint('COUNTRY API FAIELD');

    throw Future.error(NetworkExceptions.getDioException(e));
     
   }
  }
  
  @override
  Future<List<DistrictModel>> getDistrictByStateId({required String stateId}) async {
    debugPrint('DIVISION API STARTED');
    try {
        final response = await dioClient.post(Endpoints.districts,headers:  {},data: {
          "stateId" : stateId
        },);
  
      if(response.statusCode == 200){
        final List<DistrictModel> states = (response.data['data'] as List).map((e) => DistrictModel.fromJson(e)).toList();
        return await Future.value(states);
      }else {
        debugPrint('DIVISION API FAIELD');
        throw Future.error(NetworkExceptions.getDioException(response.data));
      }
  
      
    }on DioException catch (e) {
            debugPrint('DIVISION API FAIELD');
  
      throw Future.error(NetworkExceptions.getDioException(e));
      
    }

  }
  
  @override
  Future<List<StateModel>> getStateByCountry({required String countryId}) async {
   debugPrint('STATE API STARTED');
   try {
      final response = await dioClient.get(Endpoints.states,headers:  {});

    if(response.statusCode == 200){
      final List<StateModel> states = (response.data['data'] as List).map((e) => StateModel.fromJson(e)).toList();
      return states;
    }else {
      debugPrint('STATE API FAIELD');
      throw NetworkExceptions.getDioException(response.data);
    }

     
   }on DioException catch (e) {
          debugPrint('STATE API FAIELD');

    throw NetworkExceptions.getDioException(e);
     
   }
  }
  
  @override
  Future<List<CityModel>> getCityByStateId({required StateModel statemodel}) async {
    debugPrint('CITY API STARTED');
    try {
        final response = await dioClient.post(Endpoints.getCityByStateId,headers:  {},data: {
          "stateId" : statemodel.stateId
        });
  
      if(response.statusCode == 200){
        final List<CityModel> cities = (response.data['data'] as List).map((e) => CityModel.fromJson(e)).toList();
        return  cities;
      }else {
        debugPrint('CITY API FAIELD');
        throw NetworkExceptions.getDioException(response.data);
      }
  
      
    }on DioException catch (e) {
            debugPrint('CITY API FAIELD');
  
      throw NetworkExceptions.getDioException(e);
      
    }
  }
  
  @override
  Future<List<LocalityModel>> getLocaliltyByCityId({required CityModel cityModel}) async {
    debugPrint('LOCALITY API STARTED');
    try {
        final response = await dioClient.post(Endpoints.getLocalitiesByCity,headers:  {},data: {
          "cityId" : cityModel.cityId
        });
  
      if(response.statusCode == 200){
        final List<LocalityModel> localities = (response.data['data'] as List).map((e) => LocalityModel.fromJson(e)).toList();
        return  localities;
      }else {
        debugPrint('LOCALITY API FAIELD');
        throw NetworkExceptions.getDioException(response.data);
      }
  
      
    }on DioException catch (e) {
            debugPrint('LOCALITY API FAIELD');
  
      throw NetworkExceptions.getDioException(e);
      
    }
  }
}