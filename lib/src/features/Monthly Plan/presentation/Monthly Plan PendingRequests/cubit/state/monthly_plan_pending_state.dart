

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../../domain/model/get/pending_monthly_plan_response_model.dart';

part 'monthly_plan_pending_state.freezed.dart';

@freezed
class MonthlyPlanPendingRequestState with _$MonthlyPlanPendingRequestState {
  const factory MonthlyPlanPendingRequestState.initial() = Initial;
  const factory MonthlyPlanPendingRequestState.loading() = Loading;
  const factory MonthlyPlanPendingRequestState.loaded(
      PendingMonthlyPlanResponseModel monthlyPlanPendingRequests) = Loaded;
  const factory MonthlyPlanPendingRequestState.error({required ApiFailedModel apiFailedModel}) = Error;
}