import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/common/fields/string_field.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_model.dart';

import '../../../../../../../shared/data/datasource/DeliveryTypes/delivery_type_model.dart';
import '../../../../domain/model/get/payment_mode_model.dart';
import '../../../../domain/model/get/product_model.dart';
import '../../../../domain/model/get/uom_model.dart';
import '../../../../domain/model/post/payment_details_model.dart';
import '../../../../domain/model/post/product_details_post_model.dart';
import '../../../../domain/model/post/product_form_model.dart';
import '../../../../domain/model/post/product_pending_form_model.dart';

part 'sales_order_create_state.freezed.dart';
@freezed
class SalesOrderCreateState with _$SalesOrderCreateState {
  const factory SalesOrderCreateState({
    @Default('') String originalTotalAmountValue,
    @Default('') String totalPendingAmountValue,
    @Default("") String remainingPercentage,
    @Default([]) List<ProductsModel> productsList,
    @Default(null) ProductsModel? selectedProductModel,
    @Default([]) List<dynamic> selectedProductList,
    @Default(false) bool isProductLoading,
    @Default(false) bool isUomLoading,
    @Default([]) List<UOMModel> uomList,
    @Default(false) bool isSuccess,
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
  @Default([]) List<Customermodel> customerList,
  @Default(null) Customermodel? selectedCustomerModel,
  @Default(false) bool isCustomerLoading,
  @Default([]) List<ProductFormModel> productFormList,
  @Default([]) List<ProductPendingFormModel> pendingFormList,
  @Default([]) List<DeliveryTypeModel> deliveryTypesList,
  @Default(null) DeliveryTypeModel? selectedDeliveryTypeModel, 
  required StringField deliveryText,
  @Default(false) bool? isDeliveryLoading,
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
    showInputError: false,
    customerList: [],
    selectedCustomerModel: null,
    selectedProductModel: null,
    productFormList: [],
    pendingFormList : [],
    apiFailedModel: null,
    isInitialLoading: false,
    isProductLoading: false,
    isSubmitting: false,
    isUomLoading: false,
    paymentModeList: [],
    paymentsDetailsList: [],
    productDetailsPostModelList: [],
    selectedPaymentModeModel: null,
    selectedProductList: [],
    selectedUomModel: null,
    productsList: [],
    originalTotalAmountValue : '',
    totalPendingAmountValue: '',
    remainingPercentage: '',
    isSuccess: false,
    deliveryTypesList: [],
    selectedDeliveryTypeModel: null,
    deliveryText: StringField(''),
    isCustomerLoading: false,
    isDeliveryLoading: false


  );
}