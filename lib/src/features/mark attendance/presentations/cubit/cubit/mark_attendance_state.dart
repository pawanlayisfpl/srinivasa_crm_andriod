
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../shared/domain/model/Image/image_model.dart';
import '../../../../../core/model/model.dart';
import '../../../domain/domain.dart';
import '../../../domain/models/odometer_value.dart';
import '../../../domain/models/vechile_type_model.dart';

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
    @Default(false) bool loaded, 
    @Default(0) int dataState,
    @Default([]) List<VechileItemsModel> vehicleItems,
    VechileItemsModel? selectedVehicle, 
    @Default(false) bool showInputError,
    @Default([]) List<ImageModel> imageLists,
    required MarketOdometerField marketOdometerField,
   
   
  }) = _MarkAttendanceState;


  // const factory MarkAttendanceState.isSubmitting() = _IsSubmitting;


  factory MarkAttendanceState.initial() => MarkAttendanceState(
    punchInFailure: false,
    punchOutFailure: false,
    loading: false,
    punchInSuccess: false,
    punchOutSuccess: false,
    isSubmitting: false,
    apiFailModel: null,
    loaded: false, 
    dataState: 0,
    vehicleItems: const [],
    selectedVehicle: null,
    showInputError:false,
    marketOdometerField: MarketOdometerField(''),
    imageLists: const [],
   
  );
}