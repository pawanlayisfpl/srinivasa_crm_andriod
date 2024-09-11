
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Image/image_model.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api%20failed.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/checkIn_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/checkout_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/joint_employe_model.dart';

import '../../../../../../shared/domain/model/Purpose/purpose_model.dart';
import '../../../domain/model/get/last_checkin_out_respone_model.dart';

part 'checkin_state.freezed.dart';

@freezed
class CheckinState with _$CheckinState {
 

  // const factory CheckinState.loading() = _Loading;
  // const factory CheckinState.loaded({required List<EmployeeModel> employeeModel}) = _Loaded;
  // const factory CheckinState.error({required String error}) = _Error;
  // const factory CheckinState.checkInSuccess({required CheckInResponseModel checkInResponseModel}) = _CheckInSuccess;
  // const factory CheckinState.checkInError({required ApiFailedModel apiFailedModel}) = _CheckInError;
  // const factory CheckinState.checkOutSuccess({required CheckoutResponseModel checkoutResponseModel}) = _CheckOutSuccess;
  // const factory CheckinState.checkOutError({required ApiFailedModel apiFailedModel}) = _CheckOutError;
  // const factory CheckinState.lastCheckinCheckoutSuccess({required LastCheckinOutResponseModel lastCheckinOutResponseModel}) = _LastCheckinCheckoutSuccess;
  // const factory CheckinState.lastCheckinCheckoutError({required ApiFailedModel apiFailedModel}) = _LastCheckinCheckoutError;


  const factory CheckinState({
    required List<JoinEmployeModel> employeList,
    required List<JoinEmployeModel> selectedEmployeList,
    @Default(null) CheckInResponseModel? checkInResponseModel,
    @Default(null) CheckoutResponseModel? checkoutResponseModel,
    @Default(null) LastCheckinOutResponseModel? lastCheckinOutResponseModel,
    @Default(null) ApiFailedModel? apiFailedModel,
    @Default([]) List<PurposeModel> purposeList,
    @Default([]) List<PurposeModel> selectedPurposeList,
    @Default(null) PurposeModel? selectedPurpose,
    @Default(false) bool isCheckIn,
    @Default(false) bool isCheckOut,
    @Default(false) bool loaded,
    @Default(false) bool isLoading,
    @Default(false) bool isFailed,
    @Default([]) List<FileModel> filesList,
    @Default([]) List<ImageModel> imageLists,


  }) = _CheckinState;

   factory CheckinState.initial() => const CheckinState(employeList: [], selectedEmployeList: [], checkInResponseModel: null,isFailed: false, checkoutResponseModel: null, lastCheckinOutResponseModel: null, apiFailedModel: null,purposeList: [],selectedPurposeList: [],selectedPurpose: null,filesList: [],imageLists: []);
}