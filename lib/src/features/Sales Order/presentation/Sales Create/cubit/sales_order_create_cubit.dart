// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/extensions/string_extension.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api%20failed.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_code_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/data/repo/sales_repo.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/uom_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/post/product_pending_form_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/post/soc_create_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/screens/sales_pending_payment_form_widget.dart';
import 'package:uuid/uuid.dart';

import '../../../../../common/fields/string_field.dart';
import '../../../../Customer/domain/model/get/customer_model.dart';
import '../../../domain/model/get/payment_mode_model.dart';
import '../../../domain/model/get/product_model.dart';
import '../../../domain/model/post/product_form_model.dart';

@injectable
class SalesOrderCreateCubit extends Cubit<SalesOrderCreateState> {
  final SalesRepo salesRepo;
  final KeyValueStorage keyValueStorage;
  final CustomerRepo customerRepo;

  SalesOrderCreateCubit({
    required this.salesRepo,
    required this.keyValueStorage,
    required this.customerRepo,
  }) : super(SalesOrderCreateState.initial());

// INITIALLING CONTROLLERS
  TextEditingController customerCodeController = TextEditingController();
  TextEditingController orderAmountController = TextEditingController();
  TextEditingController orderAmountTotalController = TextEditingController();
  TextEditingController orderGstAmountController = TextEditingController();
  TextEditingController amountPaidController = TextEditingController();
  TextEditingController balanceAmountController = TextEditingController();
  TextEditingController orderRemarksController = TextEditingController();
  TextEditingController employeeIdController = TextEditingController();
  TextEditingController assignedToRemarksController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController balanceAmountDueDateController =
      TextEditingController();
  TextEditingController pendingPaymentDueDateController =
      TextEditingController();
  TextEditingController pendingPaymentAmountController =
      TextEditingController();

  TextEditingController pendingPaymentAmountPerentageController =
      TextEditingController();
  TextEditingController productQtyController = TextEditingController();
  TextEditingController productRateController = TextEditingController();
  TextEditingController productSellingRateController = TextEditingController();
  TextEditingController productDiscountPerQty = TextEditingController();
  TextEditingController productDiscountPerPercentage = TextEditingController();
  TextEditingController producttotalController = TextEditingController();
  TextEditingController productShipmentDateController = TextEditingController();
  TextEditingController productChDateController = TextEditingController();
// TextEditingController productQtyController = TextEditingController();
// TextEditingController productQtyController = TextEditingController();
// TextEditingController productQtyController = TextEditingController();

// clear all controller

  void cleaAllController() {
    customerCodeController.clear();
    orderAmountController.clear();
    orderGstAmountController.clear();
    amountPaidController.clear();
    balanceAmountController.clear();
    orderRemarksController.clear();
    // employeeIdController.clear();
    assignedToRemarksController.clear();
    discountController.clear();
    balanceAmountDueDateController.clear();
    orderAmountTotalController.clear();
    pendingPaymentDueDateController.clear();
    pendingPaymentAmountController.clear();
    pendingPaymentAmountPerentageController.clear();

    // product
    productRateController.clear();
    productDiscountPerPercentage.clear();
    productChDateController.clear();
    productShipmentDateController.clear();
    productDiscountPerQty.clear();
    productSellingRateController.clear();
    producttotalController.clear();
  }

  // GET ALL PRODUCTS
  // GET ALL UOMS
  // GET ALL INITIAL VALUES
  // INITIALIZING CONTROLLERS
  // SET CUSTOMER CODE
  // GET ALL CUSTOMERS

  // GET ALL INITIAL
  Future<void> getAllInitialValues() async {
    emit(SalesOrderCreateState.initial());
    // emit(state.copyWith(isInitialLoading: true));
    await Future.wait([
      getProducts(),
      getUomLists(),
      getEmployeIdValue(),
      getAllCustomer(),
      getAllPaymentMode(),
    ]);
    emit(state.copyWith(isInitialLoading: false));
  }

  Future<void> getEmployeIdValue() async {
    String? employeeId =
        keyValueStorage.sharedPreferences.getString(KeyValueStrings.userName);
    if (employeeId != null) {
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
    emit(state.copyWith(
        productsList: [], selectedProductList: [], isProductLoading: true));
    final result = await salesRepo.getAllProducts();
    result.fold((l) {
      emit(state.copyWith(
          apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),
          isProductLoading: false));
    }, (r) {
      emit(state.copyWith(productsList: r, isProductLoading: false));
    });
  }

// GET ALL UOMS
  Future<void> getUomLists() async {
    emit(state
        .copyWith(uomList: [], selectedUomModel: null, isUomLoading: true));
    final result = await salesRepo.getAllUom();
    result.fold((l) {
      emit(state.copyWith(
          apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),
          isUomLoading: false));
    }, (r) {
      emit(state.copyWith(uomList: r, isUomLoading: false));
    });
  }


  //on selling rate changed
  void onSellingRateChanged() {
    // LOGIC 1: QTY CAN BE EMPTY
    // LOGIC 2: WHEN QTY IS NOT EMPTY
       int qty = int.tryParse(productQtyController.text) ?? 0;
      double price = double.tryParse(productSellingRateController.text) ?? 0.0;
      double givenRate = double.tryParse(productRateController.text) ?? 0.0;

      if(productRateController.text.isNotEmpty && productSellingRateController.text.isNotEmpty && productQtyController.text.isNotEmpty) {
        // QTY IS AVAILABLE, PRICE IS AVAIBLE , JUST SET THE TOTAL AMOUNT QTY * SELLING RATE
        if(price > givenRate) {
          Fluttertoast.showToast(msg: 'Sorry,price can\'t be more than actual rate',backgroundColor: Colors.red,textColor: Colors.white);
          productSellingRateController.text = givenRate.toString();
          onSellingRateChanged();

        }else {
          double totalAmountValue = (qty * price);
      log(totalAmountValue.toString());
      producttotalController.text = totalAmountValue.toStringAsFixed(0);

        }
      }else {
        producttotalController.clear();
           producttotalController.text =  "0.0";
        // QTY IS NOT AVAILABLE, PRICE IS AVAIBLE , JUST SET THE TOTAL AMOUNT QTY * SELLING RATE

      }

  } 


  // ON DISCOUNT PER QTY CHANGED
// ON DISCOUNT PER QTY CHANGED

// void onDiscountPerQtyChanged() {

//   // Check if all necessary text fields are not empty
//   if (productQtyController.text.isNotEmpty &&
//       productSellingRateController.text.isNotEmpty &&
//       productRateController.text.isNotEmpty) {

//         if(productDiscountPerQty.text.isNotEmpty) {
//           productDiscountPerPercentage.clear();
//           producttotalController.text = state.originalTotalAmountValue.toString();
//         }

//     // Parse values from text controllers
//     double sellingPrice = double.tryParse(productSellingRateController.text) ?? 0.0;
//     int qty = int.tryParse(productQtyController.text) ?? 0;
//     double discountPerQtyValue = double.tryParse(productDiscountPerQty.text) ?? 0.0;

//     // Ensure discount quantity is not more than actual quantity
//     if (discountPerQtyValue <= qty) {
//       double totalAmountBeforeDiscount = sellingPrice * qty;
//       double discountAmount = discountPerQtyValue * sellingPrice;
//       double totalAmountAfterDiscount = totalAmountBeforeDiscount - discountAmount;
//       producttotalController.text = totalAmountAfterDiscount.toStringAsFixed(2);
//     } else {
//       Fluttertoast.showToast(
//         msg: 'Discount qty can\'t be more than actual qty',
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         toastLength: Toast.LENGTH_LONG,
//       );
//     }
//   } else {
//     Fluttertoast.showToast(
//       msg: 'Please fill in all required fields',
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       toastLength: Toast.LENGTH_LONG,
//     );
//   }
// }

void onDiscountPerPercentageClicked() {
  if(productDiscountPerPercentage.text.isNotEmpty && productDiscountPerPercentage.text.contains("%")) {
    productDiscountPerPercentage.text = productDiscountPerPercentage.text.split(" ").first.toString();
  }
}


void onDiscountPerQtyChanged  () {
  // Check if all necessary text fields are not empty
  if (productQtyController.text.isNotEmpty &&
      productRateController.text.isNotEmpty) {

    if (productDiscountPerQty.text.isNotEmpty) {
      productDiscountPerPercentage.clear();
      producttotalController.text = state.originalTotalAmountValue.toString();
    }else {

    }

   
    double givenPrice = double.tryParse(productRateController.text) ?? 0.0;
    int qty = int.tryParse(productQtyController.text) ?? 0;
    double discountPerQtyValue = double.tryParse(productDiscountPerQty.text) ?? 0.0;
    double finalAmount = givenPrice - discountPerQtyValue;
    const double minPercentage = 0.20;
    double minAllowedAmount = givenPrice * minPercentage;
    // Check if finalAmount is less than the minimum allowed amount
if (discountPerQtyValue <= minAllowedAmount) {


    double finaltotalAmountValue = finalAmount * qty;
    double totalGivenAmountValue = givenPrice * qty;
    productSellingRateController.text = finalAmount.toStringAsFixed(2);
    log('printing final amount value is ${finaltotalAmountValue.toString()}');
    producttotalController.text = finaltotalAmountValue.toString();


    log("selling price total amount is ${finaltotalAmountValue.toString()}");
    log('original price total amount is ${totalGivenAmountValue.toString()}');


    double discountPercentage = ((totalGivenAmountValue - finaltotalAmountValue) / totalGivenAmountValue) * 100;
    log('discount percentage is ${discountPercentage.toString()}');
    productDiscountPerPercentage.text = discountPercentage.toStringAsFixed(2) + " %";

    
 
} else {
  productDiscountPerQty.clear();
  productSellingRateController.text =  givenPrice.toString();
  producttotalController.text = state.originalTotalAmountValue.toString();

   Fluttertoast.showToast(
    msg: 'Final amount should not be greater than \n${minAllowedAmount.toIndianPriceFormat()}',
    backgroundColor: Colors.red,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
  );
}





   
  } else {
   
  }
}

void onDiscountPerPercentageChanged() {
  if (productDiscountPerPercentage.text.isEmpty && productDiscountPerQty.text.isNotEmpty) {
    producttotalController.text = state.originalTotalAmountValue.toString();
    return;
  }

  if (productQtyController.text.isNotEmpty && productRateController.text.isNotEmpty) {
    if (productDiscountPerPercentage.text.isNotEmpty) {
      productDiscountPerQty.clear();
      producttotalController.text = state.originalTotalAmountValue.toString();
    }

    int givenQty = int.tryParse(productQtyController.text) ?? 0;
    double givenRate = double.tryParse(productRateController.text) ?? 0.0;
    double discountPerPercentage = double.tryParse(productDiscountPerPercentage.text) ?? 0.0;

    if (discountPerPercentage <= 10) {
      double actualTotalAmount = givenRate * givenQty;
      double discountAmount = (actualTotalAmount * discountPerPercentage) / 100;
      double discountPerQty = discountAmount / givenQty;
      double finalAmount = actualTotalAmount - discountAmount;

      producttotalController.text = finalAmount.toString();
      // Assuming you have a controller to display discount per quantity
      productDiscountPerQty.text = discountPerQty.toStringAsFixed(2);
       double newSellingRateValue =  finalAmount / double.parse(productQtyController.text);
    log('new selling price is ${newSellingRateValue.toString()}');
    productSellingRateController.text = newSellingRateValue.toStringAsFixed(2);
    } else if (discountPerPercentage == 0.0 || productDiscountPerPercentage.text.isEmpty) {
      producttotalController.text = state.originalTotalAmountValue.toString();
    } else {
      // Handle invalid discount percentage case
      // For example, you might want to show an error message or reset the discount percentage
      productDiscountPerPercentage.text = '0.0';
      productSellingRateController.text = productRateController.text;
      producttotalController.text = state.originalTotalAmountValue.toString();
    }
  }
}


//   void onDiscountPerPercentageChanged() {
//   if (productDiscountPerPercentage.text.isEmpty && productDiscountPerQty.text.isNotEmpty) {
//     producttotalController.text = state.originalTotalAmountValue.toString();
//     return;
//   }

//   if (productQtyController.text.isNotEmpty && productRateController.text.isNotEmpty) {
//     if (productDiscountPerPercentage.text.isNotEmpty) {
//       productDiscountPerQty.clear();
//       producttotalController.text = state.originalTotalAmountValue.toString();
//     }

//     int givenQty = int.tryParse(productQtyController.text) ?? 0;
//     double givenRate = double.tryParse(productRateController.text) ?? 0.0;
//     double discountPerPercentage = double.tryParse(productDiscountPerPercentage.text) ?? 0.0;

//     if (discountPerPercentage <= 10) {
//       double actualTotalAmount = givenRate * givenQty;
//       double discountAmount = (actualTotalAmount * discountPerPercentage) / 100;
//       double finalAmount = actualTotalAmount - discountAmount;

//       producttotalController.text = finalAmount.toString();
//     } else if (discountPerPercentage == 0.0 || productDiscountPerPercentage.text.isEmpty) {
//       producttotalController.text = state.originalTotalAmountValue.toString();
//     } else {
//       // Handle invalid discount percentage case
//       // For example, you might want to show an error message or reset the discount percentage
//       productDiscountPerPercentage.text = '0.0';
//       producttotalController.text = state.originalTotalAmountValue.toString();
//     }
//   }
// }

// GET ALL CUSTOMERS
  Future<void> getAllCustomer() async {
    emit(state.copyWith(isCustomerLoading: true));
    final results = await customerRepo.getApprovedCustomerList();
    results.fold((l) {
      emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),customerList: [],selectedCustomerModel: null,isCustomerLoading: false));
    }, (r) {
      emit(state.copyWith(customerList:r,isCustomerLoading: false));
    });
    
  }

// SET SELECTED CUSTOMER
  void setSelectedCustomer(CustomerCodeModel value) {
    emit(state.copyWith(selectedCustomerModel: value));
  }

  void resetCustomer() {
    emit(state.copyWith(selectedCustomerModel: null));
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
    log(amountPaidController.text.toString());
   double newOrderAmount =  state.productFormList.fold(0.0, (acc, element) => acc + element.totalAmount);
    double paidAmountValue = double.tryParse(amountPaidController.text) ?? 0.0;


    if(paidAmountValue < newOrderAmount) {
       log('total order amount value ${newOrderAmount.toString()}');
       double newBalanceAmountValue = newOrderAmount - paidAmountValue;
        balanceAmountController.text = newBalanceAmountValue.toStringAsFixed(2);

        emit(state.copyWith(pendingFormList: []));
        balanceAmountDueDateController.clear();

    log('paid amount value ${paidAmountValue.toString()}');

    }else {
      Fluttertoast.showToast(msg: 'Paid amount can\'t be more than total order amount',backgroundColor: Colors.red,textColor: Colors.white);
      balanceAmountController.clear();
    }

  }

  // ON BALANCE AMOUNT DUE DATE
  void pickBalanceAmountDueDate({required BuildContext context}) async {
   
    final DateTime now = DateTime.now();
    final pickedDate = await showDatePicker(context: context,keyboardType: TextInputType.datetime,initialDate: now,barrierDismissible: false, firstDate: now, lastDate: DateTime(2100));

    

    if(pickedDate != null) {
       emit(state.copyWith(pendingFormList: []));
      balanceAmountDueDateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);

      if(balanceAmountController.text.isNotEmpty && balanceAmountController.text.isNotEmpty) {
  ProductPendingFormModel pendingFormModel = ProductPendingFormModel(id: const Uuid().v4().toString(), dueDate: pickedDate.toString(), dueAmount: double.tryParse(balanceAmountController.text) ?? 0.0,dueAmountPercentage: 100);
    addToProductPendingList(productPendingFormModel: pendingFormModel);
        }
      

    }else {

    }
  }

// BALANCE AMOUNT FIELD
  void onBalanceAmountChanged(String value) {
    emit(state.copyWith(balanceAmountField: NumberField(value)));
  }

// ORDER REMARKS FIELD
  void onOrderRemarksChanged(String value) {
    emit(state.copyWith(orderRemarksField: StringField(value)));
  }

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

  void resetUomType() {
    emit(state.copyWith(selectedUomModel: null));
  }

  void resetProductModel() {
    emit(state.copyWith(selectedProductModel: null,totalPendingAmountValue: ""));
    productQtyController.clear();
    productRateController.clear();
    productSellingRateController.clear();
    productDiscountPerPercentage.clear();
    productDiscountPerQty.clear();
    producttotalController.clear();
  }

  void setSelectedProductModel({required ProductsModel value}) async {
    emit(state.copyWith(apiFailedModel: null, isProductLoading: false));
    log(value.toJson().toString());
    emit(state.copyWith(selectedProductModel: value,));
    // GETTING PRODUCT PRICE
    final results = await salesRepo.getPriceByProductId(value.productId ?? 0);
    results.fold((l) {
      emit(state.copyWith(
          apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),
          selectedProductModel: null,
          isProductLoading: false));
    }, (r) {
      emit(state.copyWith(
       
          selectedProductModel: value,
          isProductLoading: false));
    productRateController.text = r.rate.toString();
  productSellingRateController.text = r.rate.toString();

    onGstAmountChanged(r.gst.toString());
  // onSellingRateChanged();

    });
  }

  void setUomType(UOMModel value) {
    emit(state.copyWith(selectedUomModel: value));
  }

// HANDLING PENDING PAYMENT FORM METHODS
  void addToProductPendingList(
      {required ProductPendingFormModel productPendingFormModel}) {
    List<ProductPendingFormModel> list = List.from(state
        .pendingFormList); // Create a new list to avoid mutating the state directly
    list.add(productPendingFormModel);
    emit(state.copyWith(pendingFormList: list));
  }

  void removeFromProductPendingList({required ProductPendingFormModel model}) {
    String id = model.id;
    List<ProductPendingFormModel> list = List.from(state
        .pendingFormList); // Create a new list to avoid mutating the state directly
    list.removeWhere((item) => item.id == id);
    emit(state.copyWith(pendingFormList: list, selectedPaymentModeModel: null));
    balanceAmountDueDateController.clear();
    balanceAmountController.clear();
    amountPaidController.clear();
  }

  void updatePendingFormById(
      {required ProductPendingFormModel productPendingFormModel}) {
    String id = productPendingFormModel.id;
    List<ProductPendingFormModel> pendingFormList = List.from(state
        .pendingFormList); // Create a new list to avoid mutating the state directly

    // Find the index of the item to update
    int index = pendingFormList.indexWhere((item) => item.id == id);

    if (index != -1) {
      // Update the item at the found index
      pendingFormList[index] = productPendingFormModel;

      // Emit the new state with the updated list
      emit(state.copyWith(pendingFormList: pendingFormList));
    }
  }

  void submitPendingProductForm({required VoidCallback successCallback,required VoidCallback    failedCallback}) {



    if(pendingPaymentDueDateController.text.isNotEmpty && pendingPaymentAmountController.text.isNotEmpty && pendingPaymentAmountPerentageController.text.isNotEmpty) {
      ProductPendingFormModel pendingFormModel = ProductPendingFormModel(id: const Uuid().v4().toString(), dueDate: DateTime.now().toIso8601String(), dueAmount: double.tryParse(pendingPaymentAmountController.text) ?? 0.0,dueAmountPercentage: double.tryParse(pendingPaymentAmountPerentageController.text) ?? 0.0);
    log(pendingFormModel.toJson().toString());
    addToProductPendingList(productPendingFormModel: pendingFormModel);
    pendingPaymentAmountController.clear();
    pendingPaymentDueDateController.clear();
    pendingPaymentAmountPerentageController.clear();
    successCallback();  
    }else {
      failedCallback();
    }
    // ProductPendingFormModel pendingFormModel = ProductPendingFormModel(
    //     id: const Uuid().v4().toString(),
    //     dueDate: pendingPaymentDueDateController.text,
    //     dueAmount: double.tryParse(pendingPaymentAmountController.text) ?? 0.0,
    //     dueAmountPercentage:
    //         double.tryParse(pendingPaymentAmountPerentageController.text) ??
    //             0.0);
    // log(pendingFormModel.toJson().toString());
  }

// HANDLING PRODUCT FORM LIST METHODSS

  void addToProductFormList({required ProductFormModel productFormModel}) {
    List<ProductFormModel> productLists = List.from(state.productFormList);
    productLists.add(productFormModel);
    emit(state.copyWith(
        productFormList: productLists, selectedProductModel: null));
  }

  void removeFromProductFormList({required ProductFormModel productFormModel}) {
    String id = productFormModel.id;
    List<ProductFormModel> productsLists = List.from(state.productFormList);
    productsLists.removeWhere((item) => item.id == id);
    emit(state.copyWith(
        productFormList: productsLists, selectedProductModel: null));
  }

  void onQtyChanged() {
    // LOGIC 1: WHEN SELLING RATE IS NULL
    // LOGIC 2: WHEN SELLING RATE IS NOT NULL

    if(productRateController.text.isNotEmpty && productQtyController.text.isNotEmpty && productSellingRateController.text.isNotEmpty) {
          // LOGIC 2: WHEN SELLING RATE IS NOT NULL

      double sellingRate = double.tryParse(productSellingRateController.text) ?? 0.0;
      int qty = int.tryParse(productQtyController.text) ?? 0;

      double totalAmountValue = (qty * sellingRate);
      producttotalController.text = totalAmountValue.toStringAsFixed(0);
    }else {
          // LOGIC 1: WHEN SELLING RATE IS NULL
    producttotalController.text = '0.0';

    }



    if(productSellingRateController.text.isNotEmpty && productRateController.text.isNotEmpty) {
      double sellingRate = double.tryParse(productSellingRateController.text) ?? 0.0;
      int qty = int.tryParse(productQtyController.text) ?? 0;

      double totalAmountValue = (qty * sellingRate);
      producttotalController.text = totalAmountValue.toString();
    }
  }

  void updateProductFormList({required ProductFormModel productFormModel}) {
    String id = productFormModel.id;
    List<ProductFormModel> productsLists = List.from(state.productFormList);

    // Find the index of the item to update
    int index = productsLists.indexWhere((item) => item.id == id);

    if (index != -1) {
      // Update the item at the found index
      productsLists[index] = productFormModel;

      // Emit the new state with the updated list
      emit(state.copyWith(productFormList: productsLists));
    }
  }

  // GET TOTAL AMOUNT FROM PRODUCT IST
 // GET TOTAL AMOUNT FROM PRODUCT LIST
void getTotalPendingAmountValue() {
  double totalProductsAmount = state.productFormList
      .map((element) => element.totalAmount)
      .reduce((acc, amount) => acc + amount);

  double totalPendingDueAmount = state.pendingFormList.fold(
      0.0, (acc, element) => acc + element.dueAmount);

 double totalPendingPercentage = state.pendingFormList.fold(
      0.0, (acc, element) => acc + double.parse(element.dueAmountPercentage.toString()));

double remainingPercentage = 100.0 - totalPendingPercentage;

  double totalValue = totalProductsAmount - totalPendingDueAmount;

  log(totalProductsAmount.toString());
  log('printing total percentage');
  log(totalPendingPercentage.toString());
  emit(state.copyWith(
    totalPendingAmountValue: totalValue.toString(),
    remainingPercentage: remainingPercentage.toString(),
  ));
}
void onDueAmountChanged() {
  if (pendingPaymentAmountController.text.isNotEmpty) {
    getTotalPendingAmountValue();
    double totalPendingAmount = double.tryParse(state.totalPendingAmountValue) ?? 0.0;
    double enteredAmount = double.tryParse(pendingPaymentAmountController.text) ?? 0.0;
    double newTotalPendingAmount = totalPendingAmount - enteredAmount;

    // Calculate the percentage
    double percentage = (enteredAmount / totalPendingAmount) * 100;
    pendingPaymentAmountPerentageController.text = percentage.toStringAsFixed(2);

    emit(state.copyWith(totalPendingAmountValue: newTotalPendingAmount.toString()));
  } else {
    getTotalPendingAmountValue();
  }
}

void onDuePercentageChanged() {
  if (pendingPaymentAmountPerentageController.text.isNotEmpty) {
    getTotalPendingAmountValue();
    double totalPendingAmount = double.tryParse(state.totalPendingAmountValue) ?? 0.0;
    double percentage = double.tryParse(pendingPaymentAmountPerentageController.text) ?? 0.0;
    double percentageAmount = (totalPendingAmount * percentage) / 100;
    double newTotalPendingAmount = totalPendingAmount - percentageAmount;

    pendingPaymentAmountController.text = percentageAmount.toStringAsFixed(2);
   
    emit(state.copyWith(totalPendingAmountValue: newTotalPendingAmount.toString()));
  } else {
    getTotalPendingAmountValue();
  }
}


  void onPickShipmentDate({required BuildContext context}) async {
   final DateTime now = DateTime.now();
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: now,
    firstDate: now,
    lastDate: DateTime(2101),
  );
    if (picked != null) {
      productShipmentDateController.text = DateFormat('dd-MM-yyyy').format(picked);
      
    }
  }

  void onPickChDate({required BuildContext context}) async {
  final DateTime now = DateTime.now();
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: now,
    firstDate: now,
    lastDate: DateTime(2101),
  );
  if (picked != null) {
    productChDateController.text =DateFormat('dd-MM-yyyy').format(picked);
  }
}


  void onPickPendingDueDate({required BuildContext context}) async {
   final DateTime now = DateTime.now();
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: now,
    firstDate: now,
    lastDate: DateTime(2101),
  );
    if (picked != null) {
      pendingPaymentDueDateController.text = picked.toString().split(" ").first.toString();
      
    }
  }
  void submitProductForm({required VoidCallback successCallback,required VoidCallback failedCallback}) {


    if(state.selectedProductModel != null && state.selectedUomModel != null && productQtyController.text.isNotEmpty && productRateController.text.isNotEmpty  && productShipmentDateController.text.isNotEmpty ) {
       ProductFormModel productFormModel = ProductFormModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        productsModel: state.selectedProductModel ,
        divisionId: state.selectedProductModel == null ? 0 : int.tryParse(state.selectedProductModel!.division!.divisionId.toString()) ?? 0,
        productId: state.selectedProductModel == null ? 0 : int.tryParse(state.selectedProductModel!.productId.toString()) ?? 0,
        quanity: int.tryParse(productQtyController.text) ?? 0,
        rate: double.tryParse(productRateController.text.toString()) ?? 0.0,
        totalAmount: double.tryParse(producttotalController.text) ?? 0.0,
        uomId:state.selectedUomModel == null ? 0 : int.tryParse(state.selectedUomModel!.uomId.toString()) ?? 0,
        quanitiyToDeliver: int.tryParse(productQtyController.text) ?? 0,
        discountPerPercentage: double.tryParse(productDiscountPerPercentage.text.toString().split(" ").first) ?? 0.0,
        discountPerQty: double.tryParse(productDiscountPerQty.text) ?? 0.0,
        gstAmount: 0.0,
        sellingRate: double.tryParse(productSellingRateController.text) ?? 0.0,
        shipmentDate: productShipmentDateController.text.isEmpty ? "" : productShipmentDateController.text,
        chDate: productChDateController.text.isEmpty ? "" : productChDateController.text);
    log(productFormModel.toJson().toString());
    List<ProductFormModel> productList = List.from(state.productFormList);
    productList.add(productFormModel);
    emit(state.copyWith(productFormList: productList,selectedUomModel: null,selectedProductModel: null,));
    productQtyController.clear();
    productRateController.clear();
    producttotalController.clear();
    productDiscountPerPercentage.clear();
    productDiscountPerQty.clear();
    productShipmentDateController.clear(); 
    productChDateController.clear();
    // CALLING TOTAL ORDER AMOUNT VALUES HERE
    getOrderAmountTotalValues();
    successCallback();
    }else {
      failedCallback();
    }



   
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
    balanceAmountDueDateController.dispose();
    orderAmountTotalController.dispose();
    pendingPaymentDueDateController.dispose();
    pendingPaymentAmountController.dispose();
    pendingPaymentAmountPerentageController.dispose();

    // product
    productRateController.dispose();
    productDiscountPerPercentage.dispose();
    productChDateController.dispose();
    productShipmentDateController.dispose();
    productDiscountPerQty.dispose();
    productSellingRateController.dispose();
    producttotalController.dispose();
    return super.close();
  }
  
 Future<void>  getAllPaymentMode() async {
  final results = await salesRepo.getAllPaymentModes();
  results.fold((l) {
    emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),paymentModeList: [],selectedPaymentModeModel: null,));
  }, (r) {
    emit(state.copyWith(paymentModeList:r));
  });
 }






 void getOrderAmountTotalValues() {
   double newOrderAmount =  state.productFormList.fold(0.0, (acc, element) => acc + element.totalAmount);

  log("total order amount is ${newOrderAmount.toString()}");

   double totalGstAmountValue = state.productFormList.fold(0.0, (acc,element) => acc + double.parse(element.gstAmount.toString()));
 
  log("total gst amount is ${totalGstAmountValue.toString()}");

  orderAmountController.text = newOrderAmount.toString();
  orderAmountTotalController.text = newOrderAmount.toString();
orderAmountController.text = (double.tryParse(newOrderAmount.toString()) ?? 0.0 - totalGstAmountValue).toString();  orderGstAmountController.text = totalGstAmountValue.toString();
 }


 void resetForm() {
  emit(state.copyWith(selectedCustomerModel: null,selectedProductList: [],pendingFormList: [],productFormList: []));
    cleaAllController();
    Fluttertoast.showToast(msg: 'Form reset successfully',backgroundColor: Colors.green,textColor: Colors.white);
 }


void createOrder() async {


CustomerCodeModel? customerModel = state.selectedCustomerModel;

List<ProductFormModel> productFormList = state.productFormList;

String? orderTotalAmountValue = orderAmountTotalController.text;

String? orderAmountValue = orderAmountController.text;

String? amountPaidValue = amountPaidController.text;

String? balanceAmountValue = balanceAmountController.text;

String? balanceDueDateValue = balanceAmountDueDateController.text;

PaymentModeModel? paymentModeModel = state.selectedPaymentModeModel;

String? orderRemarksValue = orderRemarksController.text;

String? assignedToReamarksValue = assignedToRemarksController.text;

List<ProductPendingFormModel> pendingFormList = state.pendingFormList;


if(customerModel == null || productFormList.isEmpty || orderTotalAmountValue.isEmpty|| orderAmountValue.isEmpty || amountPaidValue.isEmpty || balanceAmountValue.isEmpty || balanceDueDateValue.isEmpty || paymentModeModel == null || orderRemarksValue.isEmpty || assignedToReamarksValue.isEmpty || pendingFormList.isEmpty) {
  Fluttertoast.showToast(msg: 'Please fill in all required fields',backgroundColor: Colors.red,textColor: Colors.white);
  return;
}else {

SocCreatePostModel socCreatePostModel = SocCreatePostModel(
  customerCode: customerModel.customerId!,
  productDetails: productFormList.map((e) => ProductDetails(
    divisionId: e.divisionId,
    productId: e.productId,
    quantity: e.quanity,
    rate: e.rate,
    discountPerQuantity: double.tryParse(e.discountPerQty.toString()) ?? 0.0,
    getDiscountPerQuantityInPercent: double.tryParse(e.discountPerPercentage.toString()) ?? 0.0,
    totalAmount: e.totalAmount,
    gstAmount: double.tryParse(e.gstAmount.toString()) ?? 0.0,
    sellingRate: double.tryParse(e.sellingRate.toString()) ?? 0.0,
    uomId: e.uomId,
    quantityToDeliver: e.quanity,
    shipmentDate: e.shipmentDate,
    ceHatchDate: e.chDate,
  )).toList(),
  orderAmount: double.tryParse(orderAmountValue) ?? 0.0,
  orderGstAmount: 0.0,
  orderTotalAmount: double.tryParse(orderTotalAmountValue) ?? 0.0,
  orderDiscountAmount:  0.0,
  amountPaid: double.tryParse(amountPaidValue) ?? 0.0,
  paymentModeId: paymentModeModel.paymentModeId!,
  balanceAmount: double.tryParse(balanceAmountValue) ?? 0.0,
  balanceAmountDueDate: balanceDueDateValue,
  orderRemarks: orderRemarksValue,
  assignTo: 0,
  assignToRemarks: assignedToReamarksValue,
  pendingPaymentDetails: pendingFormList.map((e) => PendingPaymentDetails(
    dueDate: e.dueDate,
    amount: e.dueAmount,
    dueAmountPercentage: 100.0,
  )).toList(),
);


log(socCreatePostModel.toJson().toString());
emit(state.copyWith(isSubmitting: true,apiFailedModel: null));
await Future.delayed(const Duration(seconds: 2)); 

final results = await salesRepo.createSaleOrder(socCreatePostModel: socCreatePostModel);

results.fold((l) {
  emit(state.copyWith(isSubmitting: false, apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),),);
}, (r) {
  emit(state.copyWith(apiFailedModel: null,isSubmitting: false,isSuccess: true ));
  Fluttertoast.showToast(msg: 'Order created successfully',backgroundColor: Colors.green,textColor: Colors.white);
  resetForm();
});

}







}


 
}
