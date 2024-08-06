import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/model/model.dart';
import '../../../../domain/model/get/particular_sales_order_model.dart';

part 'sales_order_particular_state.freezed.dart';

@freezed
class SalesOrderParticularState with _$SalesOrderParticularState {

  factory SalesOrderParticularState({
    @Default(null) ParticularSalesOrderModel? particularSalesModel ,
    @Default(false) bool isLoading,
    @Default(null) ApiFailedModel? apiFailedModel,

  }) = _SalesOrderViewScreenState;

  factory SalesOrderParticularState.initial() => SalesOrderParticularState(
    isLoading: false,
    apiFailedModel: null,
    particularSalesModel: null,
  );
}