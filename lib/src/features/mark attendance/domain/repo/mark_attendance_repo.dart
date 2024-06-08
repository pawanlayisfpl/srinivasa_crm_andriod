import 'package:dartz/dartz.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/models/last_punch_in_out_resposne_model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/models/punch_in_out_response_model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/models/punch_in_post_model.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/models/punch_out_post_model.dart';

abstract class MarkAttendanceRepo {
  Future<Either<NetworkExceptions,PunchInOutResponseModel>> punchIn({required PunchInPostModel punchInPostModel});
  Future<Either<NetworkExceptions,PunchInOutResponseModel>> punchOut({required PunchoutPostModel punchInPostModel});
  Future<Either<NetworkExceptions,LastPunchInResponseModel>> getLastPunchInOutDetails();
}