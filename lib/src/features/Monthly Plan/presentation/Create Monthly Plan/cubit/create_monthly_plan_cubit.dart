// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import 'package:srinivasa_crm_new/shared/domain/repo/Employe/employe_repo.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/monthly_plan_customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/repo/monthly_plan_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_state.dart';

import '../../../domain/model/monthly_plan_approxkilometer_field.dart';
import '../../../domain/model/monthly_plan_date_field.dart';
import '../../../domain/model/post/monthly_plan_post_model.dart';
import '../../../domain/model/post/update_monthlyplan_postmodel.dart';

@injectable
class CreateMonthlyPlanCubit extends Cubit<CreateMonthlyPlanState> {
  final MonthlyPlanRepo monthlyPlanRepo;
  final EmployeRepo employeRepo;
  final CustomerRepo customerRepo;

  final TextEditingController _kilometerTextEditingController = TextEditingController();
  final TextEditingController _dateTextEditingController = TextEditingController();

  TextEditingController get kilometerTextEditingController => _kilometerTextEditingController;
  TextEditingController get dateTextEditingController => _dateTextEditingController;

  DateTime focusedDate = DateTime.utc(DateTime.now().year, DateTime.now().month, 1);





  CreateMonthlyPlanCubit({
    required this.monthlyPlanRepo,
    required this.employeRepo,
    required this.customerRepo,
  }) : super( CreateMonthlyPlanState.initial());


// GET ALL INITIALLY VALUES
Future<void> getAllInitialValues() async {
  _dateTextEditingController.clear();
  _kilometerTextEditingController.clear();
  emit(state.copyWith(apiFailedModel: null,isSuccess: false,showInputError: false,customerList: [],selectedCustomersList: [],dailyPlanList: []));
 
  // final data = await monthlyPlanRepo.getAssignedCustomers();
  final data1 = await customerRepo.getCustomers();

  data1.fold((l) => ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l), message: NetworkExceptions.getErrorMessage(l), errorMessage: NetworkExceptions.getErrorTitle(l)), (r) {
    emit(    state.copyWith(customerList: r.customermodel ?? []));
    });



}

setFocuedDate(DateTime dateTime) {

  focusedDate = dateTime;
}


// GET ALL MONTHS LIST
Future<void> getAllMonthsList({required String userId}) async {
  final data = await monthlyPlanRepo.getMonthlyPlanMonths(userId: userId);
  data.fold((l) => ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l), message: NetworkExceptions.getErrorMessage(l), errorMessage: NetworkExceptions.getErrorTitle(l)), (r) {
    emit(state.copyWith(monthsList: r));
  });
}
  


  void setSelectedCustomerLists({required List<Customermodel> selectedCustomers}) {
    emit(state.copyWith(selectedCustomersList: selectedCustomers));
  }


  void clearSelectedCustomerLists() {
    emit(state.copyWith(selectedCustomersList: []));

  }

  






  

  // KILOMETER FIELD
  void onKiloMeterChange({required String value}) {
    _kilometerTextEditingController.text = value;
    emit(state.copyWith(monthlyPlanKiloMeterTextField: MonthlyPlanApproxKilomenterField(value),apiFailedModel: null,isSuccess: false));
    
  }


  // DATE FIELD
  void onDateFieldChange({required String dateField}) {
    _dateTextEditingController.text = DateFormat('dd-MM-yyyy').format(DateTime.parse(dateField));
  emit(state.copyWith(dateField: MonthlyPlanDateField(dateField),apiFailedModel: null,isSuccess: false));
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
   if(date != null) {
      final dateField = date.toString().split(" ").first;
      _dateTextEditingController.text = dateField;
      onDateFieldChange(dateField: dateField);
   }
  }

  void addDailyPlanList({required DailyPlan dailyPlan}) {
    // Create a modifiable copy of the dailyPlanList
    final dailyPlanList = List<DailyPlan>.from(state.dailyPlanList);
    dailyPlanList.add(dailyPlan);
    _dateTextEditingController.clear();
    kilometerTextEditingController.clear();
    emit(state.copyWith(dailyPlanList: dailyPlanList,selectedCustomersList: [],apiFailedModel: null,isSuccess: false,showInputError: false,));
    Fluttertoast.showToast(msg: 'Plan created successfully');
  }

  void updateDailyPlanList({required DailyPlan dailyPlan}) {
  // Create a modifiable copy of the dailyPlanList
  final List<DailyPlan> dailyPlanList = List<DailyPlan>.from(state.dailyPlanList);
  
  // Find the index of the daily plan to update
  final int index = dailyPlanList.indexWhere((element) => element.createdDate.toString() == dailyPlan.createdDate.toString());
  
  // Check if the daily plan exists in the list
  if (index != -1) {
    // Update the daily plan at the found index
    dailyPlanList[index] = dailyPlan;
    
    // Clear any necessary text editing controllers
    _dateTextEditingController.clear();
    kilometerTextEditingController.clear();
    
    // Emit the new state with the updated list
    emit(state.copyWith(dailyPlanList: dailyPlanList, selectedCustomersList: [], apiFailedModel: null, isSuccess: false, showInputError: false));
    
    // Show a success message
    Fluttertoast.showToast(msg: 'Plan updated successfully');
  } else {
    // Handle the case where the daily plan was not found
    Fluttertoast.showToast(msg: 'Plan not found');
  }
}


 void removeDailyPlanList({required DailyPlan dailyPlan}) {
  // Create a new modifiable list from the existing list
  final List<DailyPlan> modifiableList = List.from(state.dailyPlanList);
  // Perform the removal on the modifiable list
  modifiableList.remove(dailyPlan);
  // Emit the new state with the updated list
  emit(state.copyWith(dailyPlanList: modifiableList));

}


bool checkIfAnyCustomerAlreadyExists() {

final dailyPlanList = state.dailyPlanList;

  for (var customer in state.selectedCustomersList) {
    if (dailyPlanList.any((element) => element.farmIds.contains(customer.farm!.farmId.toString()))) {
        return true;
    }
  }
  return false;
}


void resetForm() {
  _dateTextEditingController.clear();
  kilometerTextEditingController.clear();
  emit(state.copyWith(monthlyPlanKiloMeterTextField: MonthlyPlanApproxKilomenterField(""),dateField: MonthlyPlanDateField(""),selectedCustomersList: [],apiFailedModel: null,isSuccess: false,showInputError: false,));
}

void resetSelectedCustomers() {
  emit(state.copyWith(selectedCustomersList: []));

}

DailyPlan? findFirstMatchingDailyPlan() {
  final dailyPlanList = state.dailyPlanList;

  for (var customer in state.selectedCustomersList) {
    try {
      return dailyPlanList.firstWhere(
        (dailyPlan) => dailyPlan.farmIds.contains(customer.farm!.farmId.toString()),
      );
    } catch (e) {
      // If no element is found, continue to the next customer.
      if (e is StateError) {
        continue;
      } else {
        return null;
      }
    }
  }
  // Return null if no matching daily plan is found for any customer.
  return null;
}
List<DateTime> getStartAndEndDate() {
  // Assuming state.dailyPlanList is a List<DailyPlan>
  final List<DailyPlan> dailyPlans = List<DailyPlan>.from(state.dailyPlanList);
  dailyPlans.sort((a, b) => a.createdDate.compareTo(b.createdDate));

  // Step 2: Find the first and last date of the month
  DateTime firstDateOfMonth = DateTime(dailyPlans.first.createdDate.year, dailyPlans.first.createdDate.month, 1);
  DateTime lastDateOfMonth = DateTime(dailyPlans.last.createdDate.year, dailyPlans.last.createdDate.month + 1, 0);
 
  return [firstDateOfMonth, lastDateOfMonth];
}
List<DailyPlan> findListOfExistingDailyPlan() {
  final dailyPlanList = state.dailyPlanList;
  List<DailyPlan> matchingDailyPlans = [];

  for (var customer in state.selectedCustomersList) {
    // Filter all daily plans that contain the customer's code
    var filteredPlans = dailyPlanList.where(
      (dailyPlan) => dailyPlan.farmIds.contains(customer.farm!.farmId.toString()),
    );

    // Add all filtered plans to the matchingDailyPlans list
    matchingDailyPlans.addAll(filteredPlans);
  }

  // Remove duplicates from the list, if necessary
  matchingDailyPlans = matchingDailyPlans.toSet().toList();

  return matchingDailyPlans;
}
int countDaysWithoutSundays(int year, int month) {
  int count = 0;
  // Get the total number of days in the month
  int totalDays = DateTime(year, month + 1, 0).day;

  // Iterate through each day of the month
  for (int i = 1; i <= totalDays; i++) {
    DateTime currentDay = DateTime(year, month, i);
    // Check if the day is not Sunday
    if (currentDay.weekday != DateTime.sunday) {
      count++;
    }
  }

  return count;
}



  void onSubmit() {
    log('onsubit button called');
   
  }

  void createMonthlyPlan({required CreateMonthlyPlanPostModel createMonthlyPlanPostModel}) async {

    emit(state.copyWith(apiFailedModel:  null, isSuccess: false,showInputError: false,isLoading: false));
    final results = await monthlyPlanRepo.createMonthlyPlan(monthlyPlanPostModel: createMonthlyPlanPostModel);
     results.fold((l) {
      ApiFailedModel apiFailedModel = ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l), message: NetworkExceptions.getErrorMessage(l), errorMessage: NetworkExceptions.getErrorTitle(l));
      emit(state.copyWith(apiFailedModel: apiFailedModel,isSuccess: false,showInputError: false,isLoading: false,));
       return null;
     }, (r) => emit(state.copyWith(isSuccess: true,apiFailedModel: null,showInputError: false,isLoading: false)));
    
  }


}
