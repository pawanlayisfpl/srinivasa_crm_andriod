
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/get/customer_model.dart';

part 'search_customer_state.freezed.dart';

@freezed
class SearchCustomerState with _$SearchCustomerState {
  const factory SearchCustomerState({
    @Default('') String searchQuery,
    @Default([]) List<Customermodel> customers,
    @Default(false) bool isLoading,
    @Default(false) bool isSearchingAgain,
    @Default(false) bool hasError,
  }) = _SearchCustomerState;
}