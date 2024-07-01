
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/model/model.dart';
import '../../../domain/domain.dart';

part 'mark_attendance_state.freezed.dart';
// part 'mark_attendance_state.g.dart';

@freezed
class MarkAttendanceState with _$MarkAttendanceState {
  const factory MarkAttendanceState({
   @Default(null) LastPunchInResponseModel? lastPunchInResponseModel,
    @Default(false) bool punchInFailure,
    @Default(false) bool punchOutFailure,
    @Default(false) bool loading,
    @Default(false) bool isSubmitting,
    @Default(false) bool punchInSuccess,
    @Default(false) bool punchOutSuccess,
    @Default(null) ApiFailedModel? apiFailModel,
    @Default(false) bool loaded
   
  }) = _MarkAttendanceState;


  // const factory MarkAttendanceState.isSubmitting() = _IsSubmitting;


  factory MarkAttendanceState.initial() => const MarkAttendanceState(
    punchInFailure: false,
    punchOutFailure: false,
    loading: false,
    punchInSuccess: false,
    punchOutSuccess: false,
    isSubmitting: false,
    apiFailModel: null,
    loaded: false
   
  );
}