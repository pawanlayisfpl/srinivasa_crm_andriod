import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Address%20Repo/address_remote_datasource.dart';
import 'package:srinivasa_crm_new/shared/domain/model/City/city_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Country/country_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/District/district_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Locality/locality_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/StateModel/state_model.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Address/address_repo.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network_exception.dart';


@Injectable(as:  AddressRepo)
class AddressRepoImpl implements AddressRepo {
  final AddressRemoteDataSource addressRemoteDataSource;

  AddressRepoImpl({required this.addressRemoteDataSource});

  @override
  Future<Either<NetworkExceptions, List<CountryModel>>> getCountries() async {
    try {
      final results = await addressRemoteDataSource.getCountries();
      return Right(results);
      
    } on NetworkExceptions catch (e) {
      return Left(e);
      
    }
  }

  @override
  Future<Either<NetworkExceptions, List<DistrictModel>>> getDistrictByState({required String stateId}) async {
       try {
        final results = await addressRemoteDataSource.getDistrictByStateId(stateId: stateId); 
        return Right(results);
      
    } on NetworkExceptions catch (e) {
      return Left(e);
      
    }
  }

  @override
  Future<Either<NetworkExceptions, List<StateModel>>> getStateByCountry({required String countryId})  async{
       try {
      final results = await addressRemoteDataSource.getStateByCountry(countryId: countryId);
      return Right(results);
    } on NetworkExceptions catch (e) {
      return Left(e);
      
    }
  }

  @override
  Future<Either<NetworkExceptions, List<CityModel>>> getCityByStateId({required StateModel statemodel}) async {
    try {
      final results = await addressRemoteDataSource.getCityByStateId(statemodel: statemodel);
      return Right(results);
      
    } on NetworkExceptions catch (e) {
      return Left(e);
      
    }
  }

  @override
  Future<Either<NetworkExceptions, List<LocalityModel>>> getLocalityByCityId({required CityModel cityModel}) async {
    try {
      final results = await addressRemoteDataSource.getLocaliltyByCityId(cityModel: cityModel);
      return Right(results);
      
    } on NetworkExceptions catch (e) {
      return Left(e);
      
    }
  }

}