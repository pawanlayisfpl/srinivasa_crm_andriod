import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api%20failed.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/monthly_plan_date_field.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/update_monthlyplan_postmodel.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/view_monthly_plan_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/repo/monthly_plan_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/state/update_monthly_plan_state.dart';

import '../../../domain/model/get/monthly_plan_customer_model.dart';
import '../../../domain/model/monthly_plan_approxkilometer_field.dart';

@injectable
class UpdateMonthlyPlanCubit extends Cubit<UpdateMonthlyPlanState> {
  final MonthlyPlanRepo monthlyPlanRepo;
  final CustomerRepo customerRepo;

  UpdateMonthlyPlanCubit({required this.monthlyPlanRepo,required this.customerRepo})
      : super(UpdateMonthlyPlanState.initial());

  // CREATING CONTROLLER FOR HANDLING TEXT INPUT
  final TextEditingController _dateController = TextEditingController();
  TextEditingController get dateController => _dateController;

  final TextEditingController _approxController = TextEditingController();
  TextEditingController get approxController => _approxController;

  // CLEAR ALL CONTROLLER
  void clearAllController() {
    _dateController.clear();
    _approxController.clear();
  }

  // GET ALL INITIAL VALUES
  Future<void> getAllInitialValues({required int id}) async {
    emit(UpdateMonthlyPlanState.initial());
    // final results = await monthlyPlanRepo.getAssignedCustomers();
    final results1 = await customerRepo.getCustomers();

    results1.fold(
      (l) {
        emit(state.copyWith(
            isLoading: false,
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
      },
      (r) {
        emit(
            state.copyWith(isLoading: false, isSuccess: false, customerList: r.customermodel ?? []));
        getAllViewMonthlyPlan(id: id);
      },
    );
  }

  // GET ALL VIEW MONTHLY PLAN
  Future<void> getAllViewMonthlyPlan({required int id}) async {
    emit(state.copyWith(isLoading: true, isMonhtlPlanLoaded: false));
    final results =
        await monthlyPlanRepo.findMonthlyPlanByMonthlyPlanId(monthlyPlanId: id);
    results.fold(
      (l) {
        emit(state.copyWith(
            isLoading: false,
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
      },
      (r) {
        emit(state.copyWith(
            isLoading: false,
            viewMonthlyPlanModel: r,
            isMonhtlPlanLoaded: true,
            createdDailyPlanList:
                r.dailyPlans == null ? [] : r.dailyPlans!));

      },
    );
  }

  void setSelectedCustomerLists(
      {required List<Customermodel> selectedCustomers}) {
    log(selectedCustomers.map((e) => e.farm!.farmId).toList().toString());
    log("selected date  ${dateController.text}");

    emit(state.copyWith(selectedCustomersList: selectedCustomers));
  }

  void clearSelectedCustomerLists() {
    emit(state.copyWith(selectedCustomersList: []));
  }

  // KILOMETER FIELD
  void onKiloMeterChange({required String value}) {
    _approxController.text = value;
    emit(state.copyWith(
        monthlyPlanKiloMeterTextField: MonthlyPlanApproxKilomenterField(value),
        apiFailedModel: null,
        isSuccess: false));
  }

  // DATE FIELD
  void onDateFieldChange({required String dateField}) {
    _dateController.text =
        DateFormat('dd-MM-yyyy').format(DateTime.parse(dateField));
    emit(state.copyWith(
        dateField: MonthlyPlanDateField(dateField),
        apiFailedModel: null,
        isSuccess: false));
  }

  void showDatePickedDialog({required BuildContext context}) async {
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

// If today is not the first day of the month, prevent selection of previous dates
    final firstDate = now.day == 1 ? firstDayOfMonth : now;

    final date = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDayOfMonth,
    );
    if (date != null) {
      final dateField = date.toString().split(" ").first;
      _dateController.text = dateField;
      onDateFieldChange(dateField: dateField);
    }
  }

  void submitClicked() async {
    await Future.delayed(const Duration(seconds: 1));

    List<ViewDailyPlanModel> dailyPlanList = state.createdDailyPlanList;
    String initialDate = state.dateField.value.getOrElse(() => "");
    try {
      ViewDailyPlanModel? model = dailyPlanList.firstWhereOrNull(
          (e) => e.planDate.toString() == initialDate.toString());
      if (model != null) {
        int index = dailyPlanList.indexWhere(
            (element) => element.planDate.toString() == initialDate.toString());

        List<ViewDailyPlanCustomers> viewDailyPlanCustomersList = [];
        for (var i = 0; i < state.selectedCustomersList.length; i++) {
          // ViewDailyPlanCustomers customer = ViewDailyPlanCustomers(
          //     dailyPlanCustDetailsId: state.createdDailyPlanList[index]
          //         .viewDailyPlanCustomers!.first.dailyPlanCustDetailsId,
          //     customer: Customer(
          //       checkinLocation: state.selectedCustomersList[i].checkinLocation,
          //       checkoutLocation:
          //           state.selectedCustomersList[i].checkoutLocation,
          //       customerName: state.selectedCustomersList[i].customerName,
          //       customerAddress: state.selectedCustomersList[i].customerAddress,
          //       customerAlternateContactNumber: state
          //           .selectedCustomersList[i].customerAlternateContactNumber,
          //       customerContactNumber:
          //           state.selectedCustomersList[i].customerContactNumber,
          //       customerCategory:
          //           state.selectedCustomersList[i].customerCategory,
          //       customerEmail: state.selectedCustomersList[i].customerEmail,
          //       customerCity: state.selectedCustomersList[i].customerCity,
          //       customerState: state.selectedCustomersList[i].customerState,
          //       customerCode: state.selectedCustomersList[i].customerCode,
          //       status: state.selectedCustomersList[i].status,
          //     ));

          // ViewDailyPlanCustomers viewDailyPlanCustomers = ViewDailyPlanCustomers(
          //   dailyPlanCustDetailsId: 
          // );
          // viewDailyPlanCustomersList.add(viewDailyPlanCustomers);
        }

       

        state.createdDailyPlanList[index].customers =
            viewDailyPlanCustomersList;

 

      Fluttertoast.showToast(msg: 'Plan modified ',backgroundColor: Colors.green,textColor: Colors.white);       
      } else {
        log("Model not found");
      }
    } catch (e) {
      log("Error finding model: $e");
    }
  }

  // UPDATE MONTHLY PLAN
  Future<void> updateMonthlyPlan() async {
    emit(state.copyWith(isSubmitting: true,isSuccess: false,apiFailedModel: null,isLoading: false,));
    await Future.delayed(const Duration(seconds: 1));

    List<DailyPlan> generatedDailyPlanList = [];
    for (var i = 0; i < state.createdDailyPlanList.length; i++) {
      DailyPlan dailyPlan = DailyPlan(
        dailyPlanId: state.createdDailyPlanList[i].dailyPlanId,
        approxKms: double.tryParse(_approxController.text.toString()) ?? 0.0,
        createdDate: DateTime.parse(state.createdDailyPlanList[i].planDate
            .toString()
            .split("T")
            .first
            .toString()),
        farmIds: state.createdDailyPlanList[i].customers!
            .map((e) => e.customer?.farmId ?? '')
            .toList(),
      );
      generatedDailyPlanList.add(dailyPlan);
    }

    UpdateMonthlyPlanPostModel updateMonthlyPlanPostModel =
        UpdateMonthlyPlanPostModel(
            monthlyPlanId: state.viewMonthlyPlanModel!.monthlyPlanId.toString(),
            dailyPlans: generatedDailyPlanList.isEmpty ? [] : generatedDailyPlanList);
    log(updateMonthlyPlanPostModel.toJson().toString());
    final results = await monthlyPlanRepo.updateMonthlyPlan(
        updateMonthlyPlanPostModel: updateMonthlyPlanPostModel);

    results.fold(
      (l) {
        emit(state.copyWith(
            isSubmitting: false,
            isLoading:  false,
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
      },
      (r) {
        emit(state.copyWith(isSubmitting: false, isSuccess: true,isLoading: false));
      },
    );
  }

  Future<void> deleteMonthlyPlan(int monthlyPlanId,VoidCallback successCallback,VoidCallback failedCallback) async {
    emit(state.copyWith(isSubmitting: true,isSuccess: false,apiFailedModel: null,isLoading: false,));
    await Future.delayed(const Duration(seconds: 1));
    final results = await monthlyPlanRepo.deleteMonthlyPlanResponseModel(monthlyPlanid: monthlyPlanId.toInt());
    results.fold(
      (l) {
        emit(state.copyWith(
            isSubmitting: false,
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
            failedCallback();
      },
      (r) {
        emit(state.copyWith(isSubmitting: false,));
        successCallback();
      },
    );
   
  }
}
