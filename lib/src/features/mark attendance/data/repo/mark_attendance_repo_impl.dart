import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/network%20exception/network_exception.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/models/last_punch_in_out_resposne_model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/models/punch_in_out_response_model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/models/punch_in_post_model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/models/punch_out_post_model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/repo/mark_attendance_repo.dart';

import '../datasource/remote/mark_attendance_remote_datasource.dart';

@Injectable( as : MarkAttendanceRepo)
class MarkAttendanceRepoImpl implements MarkAttendanceRepo {
  final MarkAttendanceRemoteDataSource markAttendanceRemoteDataSource;

  MarkAttendanceRepoImpl({required this.markAttendanceRemoteDataSource});

  @override
  Future<Either<NetworkExceptions, LastPunchInResponseModel>> getLastPunchInOutDetails() async {
    try {
      final results = await markAttendanceRemoteDataSource.getLastPunchInOutDetails();
      return Right(results);
      
    } on NetworkExceptions  catch (e) {
      return Left(NetworkExceptions.getDioException(e));
      
    }
  }

  @override
  Future<Either<NetworkExceptions, PunchInOutResponseModel>> punchIn({required PunchInPostModel punchInPostModel})  async{
    try {
      final results = await markAttendanceRemoteDataSource.punchIn(punchInPostModel: punchInPostModel);
      return Right(results);
      
    } on NetworkExceptions catch (e) {
      return Left(NetworkExceptions.getDioException(e));
      
    }
  }

  @override
  Future<Either<NetworkExceptions, PunchInOutResponseModel>> punchOut({required PunchoutPostModel punchInPostModel}) async {
    try {
      final results = await markAttendanceRemoteDataSource.punchOut(punchInPostModel: punchInPostModel);
      return Right(results);
      
    } on NetworkExceptions catch (e) {
      return Left(NetworkExceptions.getDioException(e));

      
    }
  }

  
  
  

}