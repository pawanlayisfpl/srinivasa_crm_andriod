import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Purpose/purpose_remote_datasource.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Purpose/purpose_model.dart';
import 'package:srinivasa_crm_new/shared/domain/repo/Purpose/purpose_repo.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network_exception.dart';


@Injectable(as: PurposeRepo)
class PurposeRepoImpl implements PurposeRepo {
  final PurposeRemoteDatasource purposeRemoteDatasource;

  PurposeRepoImpl({required this.purposeRemoteDatasource});
  @override
  Future<Either<NetworkExceptions, List<PurposeModel>>> getAllPurpose() async {
    try {
      final purposeList = await purposeRemoteDatasource.getAllPurpose();
      return Right(purposeList);
    } on NetworkExceptions catch (e) {
      return Left(e);
    }
  }

}