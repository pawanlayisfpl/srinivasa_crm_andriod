import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/extensions/date_extension.dart';
import 'package:srinivasa_crm_new/src/core/model/api%20failed/api%20failed.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/monthly_plan_date_field.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/update_monthlyplan_postmodel.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/view_monthly_plan_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/repo/monthly_plan_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/model/post/update_monthly_plan_daily_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/state/update_monthly_plan_state.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../domain/model/monthly_plan_approxkilometer_field.dart';

@injectable
class UpdateMonthlyPlanCubit extends Cubit<UpdateMonthlyPlanState> {
  final MonthlyPlanRepo monthlyPlanRepo;
  final CustomerRepo customerRepo;

  UpdateMonthlyPlanCubit(
      {required this.monthlyPlanRepo, required this.customerRepo})
      : super(UpdateMonthlyPlanState.initial());

  // CREATING CONTROLLER FOR HANDLING TEXT INPUT
  final TextEditingController _dateController = TextEditingController();
  TextEditingController get dateController => _dateController;

  final TextEditingController _approxController = TextEditingController();
  TextEditingController get approxController => _approxController;

  DateTime foucsedDay = DateTime.now();

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
        emit(state.copyWith(
            isLoading: false,
            isSuccess: false,
            customerList: r.customermodel ?? []));
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
            createdDailyPlanList: r.dailyPlans == null ? [] : r.dailyPlans!));
        List<UpdateMonthlyDailyPlanPostModel> updateMonthlyPlanPostModelList =
            [];
        if (r.dailyPlans != null) {
          for (int i = 0; i < r.dailyPlans!.length; i++) {
            UpdateMonthlyDailyPlanPostModel updateMonthlyDailyPlanPostModel =
                UpdateMonthlyDailyPlanPostModel(
                    dailyPlanId: r.dailyPlans![i].dailyPlanId,
                    createdDate:
                        DateTime.parse(r.dailyPlans![i].planDate.toString()),
                    approxKms: double.tryParse(
                            r.dailyPlans![i].actualKms.toString()) ??
                        0.0,
                    customerCodes: r.dailyPlans![i].customers!
                        .map((e) => e.customer!.farmId.toString())
                        .toList());
            updateMonthlyPlanPostModelList.add(updateMonthlyDailyPlanPostModel);
          }
        }

        emit(state.copyWith(
            existingMonthlyPlanList: updateMonthlyPlanPostModelList));
      },
    );
  }

  void setSelectedCustomerLists(
      {required List<Customermodel> selectedCustomers}) {
    debugPrint(selectedCustomers.map((e) => e.farm!.farmId).toList().toString());
    debugPrint("selected date  ${dateController.text}");

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

        Fluttertoast.showToast(
            msg: 'Plan modified ',
            backgroundColor: Colors.green,
            textColor: Colors.white);
      } else {
        debugPrint("Model not found");
      }
    } catch (e) {
      debugPrint("Error finding model: $e");
    }
  }

  // UPDATE MONTHLY PLAN
  Future<void> updateMonthlyPlan(BuildContext context) async {
    // emit(state.copyWith(
    //   isSubmitting: true,
    //   isSuccess: false,
    //   apiFailedModel: null,
    //   isLoading: false,
    // ));
    QuickAlert.show(context: context, type: QuickAlertType.loading,text: 'Updating monthly plan');
    await Future.delayed(const Duration(seconds: 1));

    // List<DailyPlan> generatedDailyPlanList = [];
    // for (var i = 0; i < state.createdDailyPlanList.length; i++) {
    //   DailyPlan dailyPlan = DailyPlan(
    //     dailyPlanId: state.createdDailyPlanList[i].dailyPlanId,
    //     approxKms: double.tryParse(_approxController.text.toString()) ?? 0.0,
    //     createdDate: DateTime.parse(state.createdDailyPlanList[i].planDate
    //         .toString()
    //         .split("T")
    //         .first
    //         .toString()),
    //     farmIds: state.createdDailyPlanList[i].customers!
    //         .map((e) => e.customer?.farmId ?? '')
    //         .toList(),
    //   );
    //   generatedDailyPlanList.add(dailyPlan);
    // }

    // UpdateMonthlyPlanPostModel updateMonthlyPlanPostModel =
    //     UpdateMonthlyPlanPostModel(
    //         monthlyPlanId: state.viewMonthlyPlanModel!.monthlyPlanId.toString(),
    //         dailyPlans:
    //             generatedDailyPlanList.isEmpty ? [] : generatedDailyPlanList);
    // log(updateMonthlyPlanPostModel.toJson().toString());



  // UPDATE MONTHLY PLAN CUBIT CODE
     
     
     UpdateMonthlyPlanPostModel updateMonthlyPlanPostModel = UpdateMonthlyPlanPostModel(monthlyPlanId: state.viewMonthlyPlanModel!.monthlyPlanId.toString(),
      dailyPlans: 
      state.existingMonthlyPlanList.map((e) => 
      DailyPlan(createdDate: e.createdDate, approxKms: e.approxKms, farmIds: e.customerCodes,dailyPlanId: e.dailyPlanId)).toList()
      );

      debugPrint(updateMonthlyPlanPostModel.toJson().toString());

    final results = await monthlyPlanRepo.updateMonthlyPlan(
        updateMonthlyPlanPostModel: updateMonthlyPlanPostModel);

    results.fold(
      (l) {
        if(Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        QuickAlert.show(context: context,type: QuickAlertType.error,
        confirmBtnColor: Colors.black,title: 'Error',text: ApiFailedModel.fromNetworkExceptions(l).message,onConfirmBtnTap: () {
            if(Navigator.canPop(context)) {
              Navigator.pop(context);
                 if(context.mounted) {
            Navigator.pop(context);
            
          }
            }
          
       
        });
        // emit(state.copyWith(
        //     isSubmitting: false,
        //     isLoading: false,
        //     apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
      },
      (r) {
         if(Navigator.canPop(context)) {
          Navigator.pop(context);
        }
       QuickAlert.show(
  context: context,
  type: QuickAlertType.success,
  title: 'Success',
  text: 'Monthly plan updated successfully',
  onConfirmBtnTap: ()  async{
    if (Navigator.canPop(context)) {
      Navigator.pop(context); // Close the QuickAlert
      
    }
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
  }

        );
        // emit(state.copyWith(
        //     isSubmitting: false, isSuccess: true, isLoading: false));
      },
    );
  }

  Future<void> deleteMonthlyPlan(int monthlyPlanId,
      VoidCallback successCallback, VoidCallback failedCallback) async {
    emit(state.copyWith(
      isSubmitting: true,
      isSuccess: false,
      apiFailedModel: null,
      isLoading: false,
    ));
    await Future.delayed(const Duration(seconds: 1));
    final results = await monthlyPlanRepo.deleteMonthlyPlanResponseModel(
        monthlyPlanid: monthlyPlanId.toInt());
    results.fold(
      (l) {
        emit(state.copyWith(
            isSubmitting: false,
            apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
        failedCallback();
      },
      (r) {
        emit(state.copyWith(
          isSubmitting: false,
        ));
        successCallback();
      },
    );
  }

  void addToExistingPlan(BuildContext context) {
    List<UpdateMonthlyDailyPlanPostModel> updateDailyPlanPostLists = state
        .existingMonthlyPlanList
        .where((e) =>
            !isSameDay(
                e.createdDate,
                DateTime.parse(dateController.text
                    .toFormattedDate())) && // Ignore objects that match the date
            state.selectedCustomersList.any(
                (se) => e.customerCodes.contains(se.farm!.farmId.toString())))
        .toList();

    if (updateDailyPlanPostLists.isNotEmpty) {
      if (context.mounted) {
        showDialog(
            context: context,
            builder: (alertCtx) => AlertDialog(
                  shadowColor: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  actions: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(alertCtx);
                        },
                        child: const CommonTextWidget(title: 'Cancel')),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(alertCtx);
                          UpdateMonthlyDailyPlanPostModel
                              updateMonthlyDailyPlanPostModel =
                              UpdateMonthlyDailyPlanPostModel(
                                  createdDate: DateTime.parse(dateController
                                      .text
                                      .toString()
                                      .toFormattedDate()),
                                  approxKms:
                                      double.tryParse(approxController.text) ??
                                          0.0,
                                  customerCodes: state.selectedCustomersList
                                      .map((e) => e.farm!.farmId.toString())
                                      .toList());
                          emit(state.copyWith(existingMonthlyPlanList: [
                            ...state.existingMonthlyPlanList,
                            updateMonthlyDailyPlanPostModel
                          ]));
                          Fluttertoast.showToast(
                              msg: 'Plan created successfully',
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        },
                        child: const CommonTextWidget(title: 'Overwrite')),
                  ],
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonTextWidget(
                        title: "Customer already exists",
                        textColor: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        textSize: 22.sp,
                      ),
                      const Divider(),
                      10.verticalSpace,
                      CommonTextWidget(
                          maxLines: 10,
                          title: 'Customers already found for plan ' +
                              updateDailyPlanPostLists
                                  .map((e) => DateFormat.MMMd()
                                      .format(e.createdDate)
                                      .toString())
                                  .join(', ')),
                    ],
                  ),
                ));
      }
    } else {
      UpdateMonthlyDailyPlanPostModel updateMonthlyDailyPlanPostModel =
          UpdateMonthlyDailyPlanPostModel(
              createdDate: DateTime.parse(
                  dateController.text.toString().toFormattedDate()),
              approxKms: double.tryParse(approxController.text) ?? 0.0,
              customerCodes: state.selectedCustomersList
                  .map((e) => e.farm!.farmId.toString())
                  .toList());
      emit(state.copyWith(existingMonthlyPlanList: [
        ...state.existingMonthlyPlanList,
        updateMonthlyDailyPlanPostModel
      ]));
      Fluttertoast.showToast(
          msg: 'Plan created successfully',
          backgroundColor: Colors.green,
          textColor: Colors.white);
      if (context.mounted) {
        Navigator.pop(context);
      }
    }

// bool isAlreadyExists = state.existingMonthlyPlanList.any((data) {
//   // Print for debugging
//   print("Checking data: ${data.customerCodes}");

//   // Extract all farmIds from selectedCustomersList
//   var selectedFarmIds = state.selectedCustomersList
//       .map((selectedCode) => selectedCode.farm!.farmId)
//       .toSet();  // Use a Set to avoid duplicates

//   // Print for debugging
//   print("Selected Farm IDs: $selectedFarmIds");

//   // Check if all selectedFarmIds are in customerCodes
//   bool allSelectedPresent = selectedFarmIds.every((farmId) =>
//     data.customerCodes.contains(farmId)
//   );

//   // Print for debugging
//   print("All Selected Present: $allSelectedPresent");

//   return allSelectedPresent;
// });

//     if(isAlreadyExists) {
//       Fluttertoast.showToast(msg: 'Customer already exists in another plan');

//     }else {
    //   UpdateMonthlyDailyPlanPostModel updateMonthlyDailyPlanPostModel = UpdateMonthlyDailyPlanPostModel(createdDate: DateTime.parse(dateController.text.toString().toFormattedDate()), approxKms: double.tryParse(approxController.text) ?? 0.0, customerCodes: state.selectedCustomersList.map((e) => e.farm!.farmId.toString()).toList());
    // emit(state.copyWith(existingMonthlyPlanList: [...state.existingMonthlyPlanList,updateMonthlyDailyPlanPostModel]));
    // Fluttertoast.showToast(msg: 'Plan created successfully',backgroundColor: Colors.green,textColor: Colors.white);
    // if(context.mounted) {
    //   Navigator.pop(context);
    // }

//     }
  }

  void addToExistingSelectedCustomersList(
      {required UpdateMonthlyDailyPlanPostModel
          updateMonthlyDailyPlanPostModel}) {
    // Log the customer codes in the updateMonthlyDailyPlanPostModel
    debugPrint('Printing updateMonthlyDailyPlanPostModel customerCodes:');
    debugPrint(updateMonthlyDailyPlanPostModel.customerCodes
        .map((e) => e.toString())
        .toList()
        .toString());

    // Start filtering the customerList
    debugPrint("Starting to filter customerList with customerCodes: ${updateMonthlyDailyPlanPostModel.customerCodes}");

    // Filter the customerList to find matches based on farmId
    List<Customermodel> existingCustomerLists = state.customerList.where((e) {
      // Log the farmId for each customer model
      debugPrint("Checking customer with farmId: ${e.farm!.farmId}");

      // Check if any customerCode matches the farmId
      bool matches = updateMonthlyDailyPlanPostModel.customerCodes.any((ce) {
        bool isMatch = e.farm!.farmId.toString() == ce.toString();
        debugPrint("Comparing farmId: ${e.farm!.farmId.toString()} with customerCode: $ce - Match: $isMatch");
        return isMatch;
      });

      debugPrint("Customer ${e.farm!.farmId} matches any code: $matches");
      return matches;
    }).toList();

    // Log the results after filtering
    debugPrint("Filtered customer list length: ${existingCustomerLists.length}");

    // Loop through and log each customer in the filtered list
    for (int i = 0; i < existingCustomerLists.length; i++) {
      debugPrint("Existing customer at index $i: ${existingCustomerLists[i].toJson().toString()}");
    }

    // Log the results after filtering
    debugPrint("Filtered customer list length: ${existingCustomerLists.length}");

    emit(state.copyWith(selectedCustomersList: existingCustomerLists));
  }

  void updatePlan(BuildContext context, DateTime dateTime) async {
    final DateTime date = DateTime.parse(dateController.text.toFormattedDate());
    final double kilometer = double.tryParse(approxController.text) ?? 0.0;
    final List<Customermodel> customerList = state.selectedCustomersList;
    debugPrint(date.toString());
    debugPrint(kilometer.toString());
    debugPrint(customerList.length.toString());

    List<UpdateMonthlyDailyPlanPostModel> updateDailyPlanPostLists = state
        .existingMonthlyPlanList
        .where((e) =>
            !isSameDay(
                e.createdDate, date) && // Ignore objects that match the date
            state.selectedCustomersList.any(
                (se) => e.customerCodes.contains(se.farm!.farmId.toString())))
        .toList();

    if (updateDailyPlanPostLists.isNotEmpty) {
      Fluttertoast.showToast(msg: 'Customer already exists');

      if (context.mounted) {
        showDialog(
            context: context,
            builder: (alertContext) => AlertDialog(
                  shadowColor: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  backgroundColor: Colors.white,
                  actions: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(alertContext);
                        },
                        child: const CommonTextWidget(title: 'Cancel')),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(alertContext);
                          debugPrint('Starting update for existing plan');

                          // Find the existing plan with the matching date
                          UpdateMonthlyDailyPlanPostModel? existingPlan =
                              state.existingMonthlyPlanList.firstWhereOrNull(
                                  (e) => isSameDay(e.createdDate, date));

                          // If an existing plan is found, update it
                          if (existingPlan != null) {
                            existingPlan.approxKms = kilometer;
                            existingPlan.customerCodes = customerList
                                .map((customer) =>
                                    customer.farm!.farmId.toString())
                                .toList();

                            // Log the updated plan to verify changes
                            debugPrint('Updated plan: ${existingPlan.toJson().toString()}');
                            Navigator.pop(context);
                            Fluttertoast.showToast(
                                msg: 'Plan updated successfully',
                                backgroundColor: Colors.green,
                                textColor: Colors.white);
                          } else {
                            debugPrint('No existing plan found for the given date');
                          }
                        },
                        child: const CommonTextWidget(title: 'Overwrite')),
                  ],
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonTextWidget(
                        title: 'Customer already exists',
                        fontWeight: FontWeight.w600,
                        textSize:  20.sp,
                        textColor: AppColors.primaryColor,
                      ),
                      const Divider(), 20.verticalSpace,
                      // SHOW CUSTOMER NAME AND DATE
                      Text(updateDailyPlanPostLists.length > 1
                          ? "Customers already found for\n ${updateDailyPlanPostLists.map((e) => DateFormat.MMMd().format(e.createdDate))}"
                          : "Customer already found on ${updateDailyPlanPostLists.map((e) => DateFormat.yMMMd().format(e.createdDate))}")
                    ],
                  ),
                ));
      }
    } else {
      // Show a toast message

      // Log the start of the update process
      debugPrint('Starting update for existing plan');

      // Find the existing plan with the matching date
      UpdateMonthlyDailyPlanPostModel? existingPlan = state
          .existingMonthlyPlanList
          .firstWhereOrNull((e) => isSameDay(e.createdDate, date));

      // If an existing plan is found, update it
      if (existingPlan != null) {
        existingPlan.approxKms = kilometer;
        existingPlan.customerCodes = customerList
            .map((customer) => customer.farm!.farmId.toString())
            .toList();

        // Log the updated plan to verify changes
        debugPrint('Updated plan: ${existingPlan.toJson().toString()}');
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: 'Plan updated successfully',
            backgroundColor: Colors.green,
            textColor: Colors.white);
      } else {
        debugPrint('No existing plan found for the given date');
      }
    }
  }

  void reset() {
    _dateController.clear();
    _approxController.clear();
    emit(state.copyWith(
        selectedCustomersList: [],
        dateField: MonthlyPlanDateField(''),
        monthlyPlanKiloMeterTextField: MonthlyPlanApproxKilomenterField('')));
  }
}
