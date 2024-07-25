import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/common/fields/string_field.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';

import '../../../../domain/model/get/payment_mode_model.dart';
import '../../../../domain/model/get/product_model.dart';
import '../../../../domain/model/get/uom_model.dart';
import '../../../../domain/model/post/payment_details_model.dart';
import '../../../../domain/model/post/product_details_post_model.dart';

part 'sales_order_create_state.freezed.dart';
@freezed
class SalesOrderCreateState with _$SalesOrderCreateState {
  const factory SalesOrderCreateState({
    @Default([]) List<ProductsModel> productsList,
    @Default([]) List<dynamic> selectedProductList,
    @Default(false) bool isProductLoading,
    @Default(false) bool isUomLoading,
    @Default([]) List<UOMModel> uomList,
    UOMModel? selectedUomModel,
    required StringField remarksToAssignedField,
    @Default([]) List<ProductDetailsPostModel> productDetailsPostModelList,
    required StringField customerCodeField,
    required NumberField orderAmountField,
    required NumberField orderGstAmountField,
    required NumberField orderTotalAmountField,
    required NumberField orderTotalDiscountField,
    required NumberField amountPaidField,
    @Default([]) List<PaymentModeModel> paymentModeList,
    PaymentModeModel? selectedPaymentModeModel,
    required NumberField balanceAmountField,
    required StringField balanceAmountDueDateField,
    required StringField orderRemarksField,
    required StringField assignedToRemarks,
    @Default([]) List<PaymentDetailsModel> paymentsDetailsList,
    @Default(false) bool isSubmitting,
    @Default(false) bool isInitialLoading,
    @Default(null) ApiFailedModel? apiFailedModel,
  @Default(false) bool showInputError,
  }) = _SalesOrderCreateState;

   factory SalesOrderCreateState.initial() => SalesOrderCreateState(
    remarksToAssignedField: StringField(''),
    orderAmountField: NumberField('0'),
    orderGstAmountField: NumberField('0'),
    orderTotalAmountField: NumberField('0'),
    orderTotalDiscountField: NumberField('0'),
    amountPaidField: NumberField('0'),
    balanceAmountField: NumberField('0'),
    balanceAmountDueDateField: StringField(''),
    orderRemarksField: StringField(''),
    assignedToRemarks: StringField(''),
    customerCodeField: StringField(''),
    showInputError: false
  );
}