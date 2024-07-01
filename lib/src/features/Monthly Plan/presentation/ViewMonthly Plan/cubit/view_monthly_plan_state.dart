import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../domain/model/view_monthly_plan_model.dart';

part 'view_monthly_plan_state.freezed.dart';
@freezed
class ViewMonthlyPlanState with _$ViewMonthlyPlanState {
   factory ViewMonthlyPlanState.initial() = _Initial;
    factory ViewMonthlyPlanState.loading() = _Loading;
    factory ViewMonthlyPlanState.loaded({required ViewMonthlyPlanModel monthlyPlanLists,   }) = _Loaded;
    factory ViewMonthlyPlanState.error(ApiFailedModel apiFailedModel) = _Error;
  
}