// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';

import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api%20failed.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/data/repo/sales_repo.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/uom_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/post/product_pending_form_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';
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
    employeeIdController.clear();
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
    emit(state.copyWith(isInitialLoading: true));
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
        keyValueStorage.sharedPreferences.getString(KeyValueStrings.userId);
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
    if(productQtyController.text.isNotEmpty && productSellingRateController.text.isNotEmpty && productRateController.text.isNotEmpty) {
      int qty = int.tryParse(productQtyController.text) ?? 0;
      double price = double.tryParse(productSellingRateController.text) ?? 0.0;
      double givenRate = double.tryParse(productRateController.text) ?? 0.0;

      if(price <= givenRate) {
          double totalAmountValue = (qty * price);
      log(totalAmountValue.toString());
      producttotalController.text = totalAmountValue.toString();
      emit(state.copyWith(originalTotalAmountValue: producttotalController.text));

      }else if(productSellingRateController.text.isEmpty) {
        Fluttertoast.showToast(msg: 'selling rate can\'t be empty',backgroundColor: Colors.red,textColor: Colors.white);
      }
      else {
        // Fluttertoast.showToast(msg: 'Selling price can\'t be more that Actual Rate',backgroundColor: Colors.red,textColor: Colors.white);
      }

    
    }else {
      producttotalController.text =  "0.0";
    }
  } 


  // ON DISCOUNT PER QTY CHANGED
// ON DISCOUNT PER QTY CHANGED
void onDiscountPerQtyChanged() {
  String lastTotalValue = producttotalController.text;

  // Check if all necessary text fields are not empty
  if (productQtyController.text.isNotEmpty &&
      productSellingRateController.text.isNotEmpty &&
      productRateController.text.isNotEmpty) {

        if(productDiscountPerQty.text.isNotEmpty) {
          productDiscountPerPercentage.clear();
          producttotalController.text = state.originalTotalAmountValue.toString();
        }

    // Parse values from text controllers
    double sellingPrice = double.tryParse(productSellingRateController.text) ?? 0.0;
    int qty = int.tryParse(productQtyController.text) ?? 0;
    double discountPerQtyValue = double.tryParse(productDiscountPerQty.text) ?? 0.0;

    // Ensure discount quantity is not more than actual quantity
    if (discountPerQtyValue <= qty) {
      double totalAmountBeforeDiscount = sellingPrice * qty;
      double discountAmount = discountPerQtyValue * sellingPrice;
      double totalAmountAfterDiscount = totalAmountBeforeDiscount - discountAmount;
      producttotalController.text = totalAmountAfterDiscount.toStringAsFixed(2);
    } else {
      Fluttertoast.showToast(
        msg: 'Discount qty can\'t be more than actual qty',
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  } else {
    Fluttertoast.showToast(
      msg: 'Please fill in all required fields',
      backgroundColor: Colors.red,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}


  void onDiscountPerPercentageChanged() {

    if(productDiscountPerPercentage.text.isEmpty && productDiscountPerQty.text.isNotEmpty ) {
      producttotalController.text = state.originalTotalAmountValue.toString();
      return;
    }

       if (productQtyController.text.isNotEmpty &&
    productSellingRateController.text.isNotEmpty &&
    productRateController.text.isNotEmpty) {

      if(productDiscountPerPercentage.text.isNotEmpty) {
        productDiscountPerQty.clear();
        producttotalController.text = state.originalTotalAmountValue.toString();
      }
  double totalAmount = double.tryParse(state.originalTotalAmountValue) ?? 0.0;
  double discountPerPercentage = double.tryParse(productDiscountPerPercentage.text) ?? 0.0;

  if (discountPerPercentage <= 100) {
    double discountAmount = (totalAmount * discountPerPercentage) / 100;
    double totalAmountAfterDiscount = totalAmount - discountAmount;
    producttotalController.text = totalAmountAfterDiscount.toStringAsFixed(2);
  } else if (discountPerPercentage == 0.0 || productDiscountPerPercentage.text.isEmpty) {
    producttotalController.text = state.originalTotalAmountValue;
  } else {
    // Handle invalid discount percentage case
    // For example, you might want to show an error message or reset the discount percentage
    productDiscountPerPercentage.text = '0.0';
    producttotalController.text = state.originalTotalAmountValue;
  }
}

  }

// GET ALL CUSTOMERS
  Future<void> getAllCustomer() async {
    final results = await customerRepo.getAllCustomerDemo();
    results.fold((l) {
      emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l),customerList: [],selectedCustomerModel: null,));
    }, (r) {
      emit(state.copyWith(customerList:r.customermodel ?? []));
    });
    
  }

// SET SELECTED CUSTOMER
  void setSelectedCustomer(Customermodel value) {
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
    emit(state.copyWith(amountPaidField: NumberField(value)));
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
    emit(state.copyWith(selectedProductModel: null));
    productQtyController.clear();
    productRateController.clear();
    productSellingRateController.clear();
    productDiscountPerPercentage.clear();
    productDiscountPerQty.clear();
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
      productShipmentDateController.text = picked.toString().split(" ").first.toString();
      
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
    productChDateController.text = picked.toString().split(" ").first;
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
        discountPerPercentage: double.tryParse(productDiscountPerPercentage.text) ?? 0.0,
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

 
}
