import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Zone/zone_remote_datasource.dart';
import 'package:srinivasa_crm_new/shared/domain/model/zone_model.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network_exception.dart';

import '../../domain/repo/Zone/zone_repo.dart';


@Injectable(as:  ZoneRepo)
class ZoneRepoImpl implements ZoneRepo {
  final ZoneRemoteDataSource zoneRemoteDataSource;

  ZoneRepoImpl({required this.zoneRemoteDataSource});

  @override
  Future<Either<NetworkExceptions, List<ZoneModel>>> getAllZones() async {
   try {
    final zones = await zoneRemoteDataSource.getAllZones();
    return Right(zones);
     
   } on NetworkExceptions catch (e) {
    return Left(e);
     
   }
  }

}