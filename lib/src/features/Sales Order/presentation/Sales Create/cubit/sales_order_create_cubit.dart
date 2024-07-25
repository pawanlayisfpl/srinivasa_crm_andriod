// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api%20failed.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/data/repo/sales_repo.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';

import '../../../../../common/fields/string_field.dart';
import '../../../domain/model/get/payment_mode_model.dart';

@injectable
class SalesOrderCreateCubit extends Cubit<SalesOrderCreateState> {
  final SalesRepo salesRepo;
  final KeyValueStorage keyValueStorage;

  SalesOrderCreateCubit({
    required this.salesRepo,
    required this.keyValueStorage,
  }) : super(SalesOrderCreateState.initial());

// INITIALLING CONTROLLERS
TextEditingController customerCodeController = TextEditingController();
TextEditingController orderAmountController = TextEditingController();
TextEditingController orderGstAmountController = TextEditingController();
TextEditingController amountPaidController = TextEditingController() ;
TextEditingController balanceAmountController= TextEditingController();
TextEditingController orderRemarksController= TextEditingController();
TextEditingController employeeIdController= TextEditingController();
TextEditingController assignedToRemarksController= TextEditingController();
TextEditingController discountController = TextEditingController();



// clear all controller

void cleaAllController() {
  customerCodeController.clear();
  orderAmountController.clear();
  orderGstAmountController.clear();
  amountPaidController.clear();
  balanceAmountController.clear();
  orderRemarksController.clear();
  employeeIdController.clear();
  assignedToRemarksController.clear();
  discountController.clear();
}

  // GET ALL PRODUCTS
  // GET ALL UOMS
  // GET ALL INITIAL VALUES
  // INITIALIZING CONTROLLERS
  // SET CUSTOMER CODE  



  // GET ALL INITIAL
  Future<void> getAllInitialValues() async {
    emit(state.copyWith(isInitialLoading: true));
    await Future.wait([
      getProducts(),
      getUomLists(),
      getEmployeIdValue(),
    ]);
    emit(state.copyWith(isInitialLoading: false));
  }

  Future<void> getEmployeIdValue() async {
    String? employeeId =  keyValueStorage.sharedPreferences.getString(KeyValueStrings.userId);
    if(employeeId != null) {
      emit(state.copyWith(remarksToAssignedField: StringField(employeeId)));
      employeeIdController.text = employeeId;
    }
  }

  // SET CUSTOMER CODE  
  void setCustomerCode(String code) {
    customerCodeController.text = code;
    emit(state.copyWith(customerCodeField: StringField(code)));
  }




  // GET ALL PRODUCTS
  Future<void> getProducts() async {
    emit(state.copyWith(productsList: [], selectedProductList: [],isProductLoading: true));
    final result = await salesRepo.getAllProducts();
    result.fold((l) {
      emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),isProductLoading: false));
    }, (r) {
      emit(state.copyWith(productsList: r,isProductLoading: false));
    });
  }


// GET ALL UOMS
Future<void> getUomLists() async {
  emit(state.copyWith(uomList: [],selectedUomModel: null,isUomLoading: true));
  final result = await salesRepo.getAllUom();
  result.fold((l) {
    emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),isUomLoading: false));

  }, (r) {
    emit(state.copyWith(uomList: r,isUomLoading: false));
  });
}


// AMOUNT TEXTFIELD
void onAmountChanged(String value) {
  emit(state.copyWith(orderAmountField: NumberField(value)));
}

// GST AMOUNT TEXTFIELD
void onGstAmountChanged(String value) {
  emit(state.copyWith(orderGstAmountField: NumberField(value)));
}

// ORDER DISCOUNT FIELD
void onOrderDiscountChanged(String value) {
  emit(state.copyWith(orderTotalDiscountField: NumberField(value)));
}

// AMOUNT PAID FIELD
void onAmountPaidChanged(String value) {
  emit(state.copyWith(amountPaidField: NumberField(value)));
}

// BALANCE AMOUNT FIELD
void onBalanceAmountChanged(String value) {
  emit(state.copyWith(balanceAmountField: NumberField(value)));
}

// ORDER REMARKS FIELD
void onOrderRemarksChanged(String value) {
  emit(state.copyWith(orderRemarksField: StringField(value)));}

// EMPLOYEE ID FIELD
void onEmployeeIdChanged(String value) {
  emit(state.copyWith(remarksToAssignedField: StringField(value)));
}




// ASSIGNED TO REMARKS FIELD
void onAssignedToRemarksChanged(String value) {
  emit(state.copyWith(assignedToRemarks: StringField(value)));
}


// SET PAYMENT MODE
void setPaymentMode(PaymentModeModel value) {
  emit(state.copyWith(selectedPaymentModeModel: value));
}

void resetPaymentMode() {
  emit(state.copyWith(selectedPaymentModeModel: null));

}






@override
  Future<void> close() {
    customerCodeController.dispose();


    orderAmountController.dispose();
    orderGstAmountController.dispose();
    amountPaidController.dispose();
    balanceAmountController.dispose();
    orderRemarksController.dispose();
    employeeIdController.dispose();
    assignedToRemarksController.dispose();
    discountController.dispose();
    return super.close();
  }


}
