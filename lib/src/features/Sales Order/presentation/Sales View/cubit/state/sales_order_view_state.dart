import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api_failed_model.dart';
import '../../../../domain/model/get/view_sales_order_model.dart';

part 'sales_order_view_state.freezed.dart';

@freezed
class SalesOrderViewState with _$SalesOrderViewState {
  factory SalesOrderViewState({
    required bool isLoading,
    ApiFailedModel? apiFailedModel,
    required ViewSalesOrderModel viewSalesOrderModel,
  }) = _SalesOrderViewState;

  factory SalesOrderViewState.initial() => SalesOrderViewState(
        isLoading: false,
        viewSalesOrderModel: ViewSalesOrderModel(orders: []),
      );
}