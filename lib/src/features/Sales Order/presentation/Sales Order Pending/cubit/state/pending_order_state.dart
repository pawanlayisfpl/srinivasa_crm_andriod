
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/pending_order_model.dart';


part 'pending_order_state.freezed.dart';

@freezed
class PendingOrderState with _$PendingOrderState {
  const factory PendingOrderState.initial() = Initial;
  const factory PendingOrderState.loading() = Loading;
  const factory PendingOrderState.loaded({required PendingOrdersModel pendingOrderModel}) = Loaded;
  const factory PendingOrderState.error({required ApiFailedModel apiFailedModel}) = Error;

}