import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Divisions/divisions_remote_datasource.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Division/division_model.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Divisions/divison_repo.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network_exception.dart';

@Injectable(as:  DivisionRepo)
class DivisionRepoimpl implements DivisionRepo {
  final DivisonsRemoteDataSource dataSource;

  DivisionRepoimpl({required this.dataSource});

  @override
  Future<Either<NetworkExceptions, List<DivisionModel>>> getDivisions() async {
   try {
     final resutls = await dataSource.getDivisions();
     return right(resutls);
   }on NetworkExceptions catch (e) {
    return left(e);
     
   }
  }
}