
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/shared/domain/model/Employe/employe_model.dart';



part 'monthly_paln_search_state.freezed.dart';
@freezed
class MonthlyPlanSearchState with _$MonthlyPlanSearchState {
  const factory MonthlyPlanSearchState({
    @Default('') String searchQuery,
    @Default([]) List<EmployeeModel> empolyesList,
    @Default(false) bool isLoading,
    @Default(false) bool isSearchingAgain,
    @Default(false) bool hasError,
  }) = _MonthlyPlanSearchState;


  factory MonthlyPlanSearchState.initial() => const MonthlyPlanSearchState(
    searchQuery: '',
    empolyesList: [],
    isLoading: false,
    isSearchingAgain: false,
    hasError: false,
  );
}