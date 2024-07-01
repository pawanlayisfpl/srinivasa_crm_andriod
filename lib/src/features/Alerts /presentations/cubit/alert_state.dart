
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/get/alert_response_model.dart';

part 'alert_state.freezed.dart';

@freezed
class AlertState with _$AlertState {
  // const factory AlertState.initial() = _Initial;
  // const factory AlertState.loading() = _Loading;
  // const factory AlertState.loaded( {required List<AlertModel> alertsList}) = _Loaded;
  // const factory AlertState.error({required ApiFailedModel apiFailedModel}) = _Error;

  const factory AlertState({
    @Default([]) List<AlertModel> alertsList,
    @Default(false) bool isLoading,
    @Default(null) ApiFailedModel? apiFailedModel,

  }) = _AlertState;

  // factory AlertState.initial() => const AlertState();
  factory AlertState.initial() => AlertState(
    alertsList: [],
    isLoading: false,
    apiFailedModel: null,
  );

}