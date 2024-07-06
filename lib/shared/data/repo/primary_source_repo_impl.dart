import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/shared/data/datasource/remote/Primary%20Source/primary_source_remote_datasource.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Primary%20Source/primary_source_model.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network_exception.dart';

import '../../domain/repo/Primary Source/primary_source_repo.dart';


@Injectable(as: PrimarySourceRepo)
class PrimarySourceRepoImpl implements PrimarySourceRepo {
  final PrimarySourceRemoteDataSource primarySourceRemoteDataSource;

  PrimarySourceRepoImpl({required this.primarySourceRemoteDataSource});

  @override
  Future<Either<NetworkExceptions, List<PrimarySourceModel>>> getPrimarySources() async {
    try {
      final results = await primarySourceRemoteDataSource.getPrimarySources();
      return Right(results);
      
    }on NetworkExceptions catch (e) {
      return Left(e);
      
    }
  }

}