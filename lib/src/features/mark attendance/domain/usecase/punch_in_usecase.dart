import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/models/punch_in_out_response_model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/models/punch_in_post_model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/repo/mark_attendance_repo.dart';


@injectable
class PunchInUseCase {
  final MarkAttendanceRepo markAttendanceRepo;

  PunchInUseCase({required this.markAttendanceRepo});


  Future<Either<NetworkExceptions,PunchInOutResponseModel>> execute({required PunchInPostModel punchInPostModel}) async {
    return await markAttendanceRepo.punchIn(punchInPostModel: punchInPostModel);
    
  }
}