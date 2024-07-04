
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_model.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_search_response_model.dart';



part 'monthly_paln_search_state.freezed.dart';
@freezed
class MonthlyPlanSearchState with _$MonthlyPlanSearchState {
  const factory MonthlyPlanSearchState({
    @Default('') String searchQuery,
    @Default([]) List<EmployeeModel> empolyesList,
    @Default(null) MonthlyPlanSearchResponseModel? monthlyPlanSearchResponseModel,
    @Default(false) bool isLoading,
    @Default(false) bool isSearchingAgain,
    @Default(false) bool hasError,
    @Default(null) ApiFailedModel? apiFailedModel,
  }) = _MonthlyPlanSearchState;


  factory MonthlyPlanSearchState.initial() => const MonthlyPlanSearchState(
    searchQuery: '',
    empolyesList: [],
    isLoading: false,
    isSearchingAgain: false,
    hasError: false,
    monthlyPlanSearchResponseModel: null,
    apiFailedModel: null
  );
}