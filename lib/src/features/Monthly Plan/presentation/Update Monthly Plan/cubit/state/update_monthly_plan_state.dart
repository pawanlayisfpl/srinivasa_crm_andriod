
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/view_monthly_plan_model.dart';

import '../../../../../../core/model/api failed/api_failed_model.dart';
import '../../../../domain/model/get/monthly_plan_customer_model.dart';
import '../../../../domain/model/monthly_plan_approxkilometer_field.dart';
import '../../../../domain/model/monthly_plan_date_field.dart';

part 'update_monthly_plan_state.freezed.dart';

@freezed
class UpdateMonthlyPlanState with _$UpdateMonthlyPlanState {
  const factory UpdateMonthlyPlanState({
    @Default(false) bool isLoading,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    @Default(false) bool isMonhtlPlanLoaded,
    @Default(null) ApiFailedModel? apiFailedModel,
    @Default(null) ViewMonthlyPlanModel? viewMonthlyPlanModel,
    @Default([]) List<Customermodel> customerList,
    @Default([]) List<Customermodel> selectedCustomersList,
    @Default([]) List<ViewDailyPlanModel> createdDailyPlanList,
    required MonthlyPlanApproxKilomenterField monthlyPlanKiloMeterTextField,
    required MonthlyPlanDateField dateField,
    
    
  }) = _UpdateMonthlyPlanState;


  factory UpdateMonthlyPlanState.initial() => UpdateMonthlyPlanState(
        isLoading: false,
        isSubmitting: false,
        isSuccess: false,
        apiFailedModel: null,
        viewMonthlyPlanModel: null,
        customerList: [],
        selectedCustomersList: [],
        monthlyPlanKiloMeterTextField: MonthlyPlanApproxKilomenterField(""),
       dateField: MonthlyPlanDateField(""),
       createdDailyPlanList: [],
       isMonhtlPlanLoaded: false
      );

 
}