import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_months_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/monthly_plan_approxkilometer_field.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/monthly_plan_date_field.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/monthly_plan_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/route_model.dart';

import '../../../../Customer/domain/model/get/customer_model.dart';
import '../../../domain/model/get/monthly_plan_customer_model.dart';
import '../../../domain/model/post/update_monthlyplan_postmodel.dart';


part 'create_monthly_plan_state.freezed.dart';
@freezed
class CreateMonthlyPlanState with _$CreateMonthlyPlanState {
  // const factory CreateMonthlyPlanState.initial() = _Initial;
  // const factory CreateMonthlyPlanState.loading() = _Loading;
  // const factory CreateMonthlyPlanState.loaded({required List<MonthlyPlanCustomerModel> customerList}) = _Loaded;
  // const factory CreateMonthlyPlanState.onSelectedCustomerListChange({required List<MonthlyPlanCustomerModel> selectedCustomers}) = _OnSelectedCustomerListChange;
  // const factory CreateMonthlyPlanState.error({required ApiFailedModel apiFailedModel}) = _Error;
  // const factory CreateMonthlyPlanState.onKiloMeterChange({required MonthlyPlanApproxKilomenterField monthlyPlanKiloMeterTextField}) = _OnKiloMeterChanged;
  // const factory CreateMonthlyPlanState.onDateFieldChange({required MonthlyPlanDateField dateField}) = _OnDateFieldChange;
  // const factory CreateMonthlyPlanState.kilometerChanged({required MonthlyPlanApproxKilomenterField kilometerField}) = _KilometerChanged;
  //   const factory CreateMonthlyPlanState.showInputError({required bool isValidated}) = _FormValidated;

  const factory CreateMonthlyPlanState({
    required List<Customermodel> customerList,
    required List<Customermodel> selectedCustomersList,
    required MonthlyPlanApproxKilomenterField monthlyPlanKiloMeterTextField,
    required MonthlyPlanDateField dateField,
    required ApiFailedModel? apiFailedModel,
    required bool? isSuccess,
    required bool? showInputError,
    @Default([]) List<MonthlyPlanMonthsModel> monthsList,
    @Default(null) bool? isLoading,
    @Default(null) bool? isInitialLoading,
    @Default([]) List<DailyPlan> dailyPlanList,

  }) = _CreateMonthlyPlanState;


  factory CreateMonthlyPlanState.initial() => CreateMonthlyPlanState(
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