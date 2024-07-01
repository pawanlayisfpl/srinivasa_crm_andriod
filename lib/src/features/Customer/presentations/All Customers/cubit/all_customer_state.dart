
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../domain/model/get/customer_model.dart';

part 'all_customer_state.freezed.dart';

@freezed
class AllCustomerState with _$AllCustomerState{
  const factory AllCustomerState.initial() = Initial;
  const factory AllCustomerState.loading() = Loading;
  const factory AllCustomerState.loaded(List<Customermodel> customerLists) = Loaded;
  const factory AllCustomerState.error(ApiFailedModel message) = Error;
  
}