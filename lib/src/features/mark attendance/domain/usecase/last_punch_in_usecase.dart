import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/models/last_punch_in_out_resposne_model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/repo/mark_attendance_repo.dart';


@injectable
class LastPunchInOutUseCase {
  final MarkAttendanceRepo markAttendanceRepo;

  LastPunchInOutUseCase({required this.markAttendanceRepo});


  Future<Either<NetworkExceptions,LastPunchInResponseModel>> execute() async {
    return await markAttendanceRepo.getLastPunchInOutDetails();
    
  }
}