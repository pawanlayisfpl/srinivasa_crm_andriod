import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/features/mark%20attendance/domain/models/models.dart';

import '../../../domain/domain.dart';

part 'mark_attendance_state.freezed.dart';

@freezed
class MarkAttendanceState with _$MarkAttendanceState {
  const factory MarkAttendanceState.initial() = _Initial;
  const factory MarkAttendanceState.loaded({required LastPunchInResponseModel lastPunchInResponseModel}) = _Loaded;
  
  const factory MarkAttendanceState.loading() = _Loading;
  
  const factory MarkAttendanceState.error(String message) = _Error;
  
  const factory MarkAttendanceState.punchInSuccess(String successMessage) = _PunchInSuccess;
  
  const factory MarkAttendanceState.punchInFailure(String errorMessage) = _PunchInFailure;
  
  const factory MarkAttendanceState.punchOutSuccess(String successMessage) = _PunchOutSuccess;
  
  const factory MarkAttendanceState.punchOutFailure(String errorMessage) = _PunchOutFailure;
  
  const factory MarkAttendanceState() = _MarkAttendanceState;
}