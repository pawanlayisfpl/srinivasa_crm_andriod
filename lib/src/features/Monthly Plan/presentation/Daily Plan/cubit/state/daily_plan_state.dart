import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/monthly_plan_approxkilometer_field.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/monthly_plan_date_field.dart';

import '../../../../../Customer/domain/model/get/customer_model.dart';
import '../../../../domain/model/post/update_monthlyplan_postmodel.dart';

part 'daily_plan_state.freezed.dart';

@freezed
class DailyPlanState with _$DailyPlanState {
 

  const factory DailyPlanState({
    required List<Customermodel> customerList,
    required List<Customermodel> selectedCustomersList,
    required MonthlyPlanApproxKilomenterField monthlyPlanKiloMeterTextField,
    required MonthlyPlanDateField dateField,
    required ApiFailedModel? apiFailedModel,
    required bool? isSuccess,
    required bool? showInputError,
    @Default(null) bool? isLoading,
    @Default(null) bool? isInitialLoading,
    @Default([]) List<DailyPlan> dailyPlanList,

  }) = _DailyPlanState;


  factory DailyPlanState.initial() => DailyPlanState(
    customerList: [],
    selectedCustomersList: [],
    monthlyPlanKiloMeterTextField: MonthlyPlanApproxKilomenterField(''),
    dateField: MonthlyPlanDateField(''),
    apiFailedModel: null,
    isSuccess: false,
    showInputError: false,
    dailyPlanList: [],
    isLoading:  null,
    isInitialLoading: null
  );
}
