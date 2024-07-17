import 'package:dartz/dartz.dart';
import 'package:srinivasa_crm_new/shared/domain/model/City/city_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Country/country_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/District/district_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Locality/locality_model.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../model/StateModel/state_model.dart';

abstract class AddressRepo {
  Future<Either<NetworkExceptions, List<CountryModel>>> getCountries();
  Future<Either<NetworkExceptions, List<StateModel>>> getStateByCountry({required String countryId});
  Future<Either<NetworkExceptions, List<DistrictModel>>> getDistrictByState({required String stateId});
  Future<Either<NetworkExceptions,List<CityModel>>> getCityByStateId({required StateModel statemodel});
  Future<Either<NetworkExceptions,List<LocalityModel>> > getLocalityByCityId({required CityModel cityModel});
}