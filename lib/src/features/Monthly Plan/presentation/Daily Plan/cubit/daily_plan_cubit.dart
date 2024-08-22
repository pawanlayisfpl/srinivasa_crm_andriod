// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/widgets/loading/common_progress_dialog.dart';
import 'package:srinivasa_crm_new/src/core/extensions/date_extension.dart';

import 'package:srinivasa_crm_new/src/core/model/api%20failed/api%20failed.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/monthly_plan_approxkilometer_field.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/monthly_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/repo/monthly_plan_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/cubit/state/daily_plan_state.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/model/post/daily_plan_postModel.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/model/post/delete_dailyplan_postmodel.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/repo/daily_plan_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart';

import '../../../../Customer/domain/model/get/customer_model.dart';
import '../../../domain/model/monthly_plan_date_field.dart';
import '../../../domain/model/view_monthly_plan_model.dart';

@injectable
class DailyPlanCubit extends Cubit<DailyPlanState> {
  final CustomerRepo customerRepo;
  final MonthlyPlanRepo monthlyPlanRepo;
  final DailyPlanRepo dailyPlanRepo;

  final dateController = TextEditingController();
  final kilometerController = TextEditingController();
  DailyPlanCubit(
    this.customerRepo,
    this.monthlyPlanRepo,
    this.dailyPlanRepo,
  ) : super(DailyPlanState.initial());


  clearAllController() {
    dateController.clear();
    kilometerController.clear();
  }



void getAllInitialValues() async {
  await Future.wait([
     getAllCustomers(),
  ]);
}

  Future<void>  getAllCustomers() async {
    final results = await  customerRepo.getCustomers();
    results.fold(
      (l) => emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l))),
      (r) {
        clearAllController();
        emit(state.copyWith(customerList: r.customermodel ?? []));
      },
    );
  }


  void pickDailyPlanDate({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      emit(state.copyWith(dateField: MonthlyPlanDateField(DateFormat('d-MM-yyyy').format(picked))));
      dateController.text = DateFormat('d-MM-yyyy').format(picked);
    }
    
  }


   void clearSelectedCustomerLists() {
    emit(state.copyWith(selectedCustomersList: []));

  }


  void setSelectedCustomerLists({required List<Customermodel> selectedCustomers}) {
    emit(state.copyWith(selectedCustomersList: selectedCustomers));
  }


  void resetState() {
    clearAllController();
    clearSelectedCustomerLists();
    emit(state.copyWith(monthlyPlanKiloMeterTextField: MonthlyPlanApproxKilomenterField('')));
    
  }

  Future<void> submit({required BuildContext context,required int monthlyPlanId,required bool isConfirmed,required VoidCallback voidCallback}) async {
     DailyPlan dailyPlan = DailyPlan(createdDate: dateController.text.toFormattedDate(), approxKms: double.tryParse(kilometerController.text) ?? 0.0 , customerCodes: [
                 state.customerList.first.farm!.farmId.toString()

    ]);
    DailyPlanCreateModel dailyPlanCreateModel = DailyPlanCreateModel(monthlyPlanId: monthlyPlanId, dailyPlan: dailyPlan, confirmed: isConfirmed);
   log(dailyPlanCreateModel.toJson().toString());
    
    ProgressDialogUtils.showProgressDialog(context: context);
    final results = await dailyPlanRepo.createDailyPlan(
      dailyPlanPostModel: dailyPlanCreateModel,
    );

    results.fold(
      (l) {
        ProgressDialogUtils.hideProgressDialog();
        emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
      },
      (r) {
        ProgressDialogUtils.hideProgressDialog();
        voidCallback();
        Navigator.pop(context);
        QuickAlert.show(context: context, type: QuickAlertType.success, title: 'Success', text: 'Daily Plan Created Successfully');
      },
    );
  }

     // SET DATE
     // SET KILOMETER
       // SET CUSTOMER

       void setDate(String date) {
          emit(state.copyWith(dateField: MonthlyPlanDateField(date)));
          dateController.text= date;
       }

       void setKilometer(String kilometer) {
          emit(state.copyWith(monthlyPlanKiloMeterTextField: MonthlyPlanApproxKilomenterField(kilometer)));
          kilometerController.text= kilometer;
       }

        void setCustomer(String customer) {
            emit(state.copyWith(selectedCustomersList: [Customermodel(farm: Farm(farmId: int.tryParse(customer)))]));
        }

        void setCustomers(List<Customermodel> customers) {
            emit(state.copyWith(selectedCustomersList: customers));
        }



// DELETE DAILY PLAN
Future<void> deleteDailyPlan({required BuildContext ctx,required DailyplanDeletePostModel dailyPlanDeletePostModel,required VoidCallback callback}) async {
  QuickAlert.show(context: ctx, type: QuickAlertType.loading, title: 'Loading', text: 'Deleting Daily Plan',disableBackBtn: true,barrierDismissible: false,animType: QuickAlertAnimType.scale);
  final results = await dailyPlanRepo.deleteDailyPlan(dailyPlanDeletePostModel: dailyPlanDeletePostModel);
  results.fold((l) {
    emit(state.copyWith(apiFailedModel: ApiFailedModel.fromNetworkExceptions(l)));
     Navigator.pop(ctx);
    if(ctx.mounted) {
    QuickAlert.show(context: ctx, type: QuickAlertType.error, title: 'Error', text: 'Failed to Delete Daily Plan');


    }
  }, (r) {
    Navigator.pop(ctx);
    callback();

    
    if(ctx.mounted) {
    QuickAlert.show(context: ctx, type: QuickAlertType.success, title: 'Success', text: 'Daily Plan Deleted Successfully');

    }
  });
}



@override
  Future<void> close() {
    dateController.dispose();
    kilometerController.dispose();
    return super.close();
  }



}
