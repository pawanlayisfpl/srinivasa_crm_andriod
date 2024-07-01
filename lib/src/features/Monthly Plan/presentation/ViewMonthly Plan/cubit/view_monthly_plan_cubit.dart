// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/approve_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/reject_monthly_plan_post_model.dart';

import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/repo/monthly_plan_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_state.dart';

import '../../../../Alerts /domain/model/get/alert_response_model.dart';

@injectable
class ViewMonthlyPlanCubit extends Cubit<ViewMonthlyPlanState> {
  final MonthlyPlanRepo monthlyPlanRepo;

   ViewMonthlyPlanCubit(
    this.monthlyPlanRepo,
  ) : super(ViewMonthlyPlanState.initial());


  TextEditingController _rejectReasonController = TextEditingController();
  TextEditingController get rejectReasonController => _rejectReasonController;


  bool _isManagerClicked = false;
  bool get isManagarClicked => _isManagerClicked;

  bool? _isMonthlyPlan;
  bool? get isMonthlyPlan => _isMonthlyPlan;


  AlertModel? _alertModel;
  AlertModel? get alertModel => _alertModel;

  void setAlertModelValue(AlertModel alertModel) {
    _alertModel = alertModel;
  }

  void resetAlertModelValue() {
    _alertModel = null;
  }

  void monthlyPlanClickTrue() {
    _isMonthlyPlan = true;
  
  }
  void monthlyPlanClickedFalse() {
    _isMonthlyPlan = false;
  
  }

  String? _type;
  String? get type => _type;


  void setTypeValue(String type) {
    _type = type;
  }

  void setTypeToNull() {
    _type = null;
  }

  void resetAll() {
    _isMonthlyPlan = null;
    _type = null;
    _isManagerClicked = false;
    _alertModel = null;
  }







  void managerClickTrue() {
    _isManagerClicked = true;
  
  }
  void managerClickedFalse() {
    _isManagerClicked = false;
  
  }


// GET ALL MONTHLY PLAN DATA
  Future<void> getAllMonthlyPlanData({required String selectedDate}) async {
    emit(ViewMonthlyPlanState.loading());
    await Future.delayed(const Duration(seconds: 1));
    final result = await monthlyPlanRepo.getMonthlyPlans(selectedDate: selectedDate);
    result.fold(
      (l) {
        ApiFailedModel apiFailedModel = ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l), message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l));
        emit(ViewMonthlyPlanState.error(apiFailedModel));
      },
      (r) {
        emit(ViewMonthlyPlanState.loaded(monthlyPlanLists: r));
      },
    );
  }


  // GET ALL MONTHLY PLAN
  Future<void> getAllMonthlyPlanByMonthlyPlanID({required int id}) async {
    emit(ViewMonthlyPlanState.loading());
    await Future.delayed(const Duration(milliseconds: 800));
    final results = await monthlyPlanRepo.findMonthlyPlanByMonthlyPlanId(monthlyPlanId: id);
    results.fold((l) => emit(ViewMonthlyPlanState.error(ApiFailedModel.fromNetworkExceptions(l))), (r) => emit(ViewMonthlyPlanState.loaded(monthlyPlanLists: r)));
  }

  // APPROVE MONTHLY PLAN
  Future<void> approveMonthlyPlan({required BuildContext context}) async {
            ApprovePlanPostModel? approvePlanPostModel  = ApprovePlanPostModel(monthlyPlanId: _alertModel != null ? _alertModel!.monthlyPlanId.toString() : "");

    final result = await monthlyPlanRepo.approveMonthlyPlan(approvePlanPostModel: approvePlanPostModel);
    result.fold(
      (l) {
        Navigator.pop(context);
        
        ApiFailedModel apiFailedModel = ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l), message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l));
        if(context.mounted) {
          QuickAlert.show(context: context, type: QuickAlertType.error,title: "Error",text: apiFailedModel.errorMessage.toString());

        }
        // emit(ViewMonthlyPlanState.error(apiFailedModel));
      },
      (r) {
        Navigator.pop(context);
        if(context.mounted) {
          
          QuickAlert.show(context: context, type: QuickAlertType.success,
          confirmBtnText: 'Okay',
          barrierDismissible: false,
          text: 'Monthly Plan Approved Successfully',
          title: 'Approved',
          animType: QuickAlertAnimType.slideInUp,
         
          );
        }

      },
    );
  }


  Future<void> rejectMonthlyPlan({required BuildContext context}) async {
    RejectMonthlyPlanPostModel rejectMonthlyPlanPostModel = RejectMonthlyPlanPostModel(monthlyPlanId: _alertModel!.monthlyPlanId.toString(), comments: _rejectReasonController.text.toString());
    final results = await monthlyPlanRepo.rejectMonthlyPlan(rejectMonthlyPlanPostModel: rejectMonthlyPlanPostModel);
    results.fold(
      (l) {
        Navigator.pop(context);
        ApiFailedModel apiFailedModel = ApiFailedModel(statusCode: NetworkExceptions.getStatusCode(l), message: NetworkExceptions.getErrorTitle(l), errorMessage: NetworkExceptions.getErrorMessage(l));
        if(context.mounted) {
          QuickAlert.show(context: context, type: QuickAlertType.error,title: "Error",text: apiFailedModel.errorMessage.toString());

        }
        // emit(ViewMonthlyPlanState.error(apiFailedModel));
      },
      (r) {
        _rejectReasonController.clear();
        resetAll();
        Navigator.pop(context);
        if(context.mounted) {
          QuickAlert.show(context: context, type: QuickAlertType.success,
          confirmBtnText: 'Okay',
          text: 'Monthly Plan Rejected Successfully',
          title: 'Rejected',
          animType: QuickAlertAnimType.slideInUp,
        
         
          );
        }

      },
    );
  }
  




 


  
}
