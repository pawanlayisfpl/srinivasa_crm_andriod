import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Address%20Repo/address_remote_datasource.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Country/country_model.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
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
  Future<Either<NetworkExceptions, List<DivisionModel>>> getDivisionByState({required String stateId}) async {
       try {
        final results = await addressRemoteDataSource.getDivisionByState(stateId: stateId); 
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

}