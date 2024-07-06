import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/state/update_monthly_plan_state.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/update_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/screen/widget/update_monthly_plan_calender_widget.dart';

class UpdateMonthlyPlanBodyWidget extends StatelessWidget {
  const UpdateMonthlyPlanBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateMonthlyPlanCubit, UpdateMonthlyPlanState>(
      listener: (context, state) {
        if(state.isSuccess) {
            if(state.isSubmitting == false) {
            Navigator.pop(context);
          }
          QuickAlert.show(context: context, type: QuickAlertType.success, title: 'Success', text: 'Monthly plan updated successfully',
        animType: QuickAlertAnimType.scale,
      onConfirmBtnTap: () {
        Navigator.pop(context);
        if(context.mounted) {
          Navigator.pop(context);
        }
      },
      confirmBtnText: "Okay",
      confirmBtnColor: AppColors.blackColor,
      barrierDismissible: false,

          
          );
        }

        if(state.isSubmitting) {

        
          QuickAlert.show(context: context,
          // barrierDismissible: false,
           type: QuickAlertType.loading, title: 'Loading', text: 'Monthly plan updating...', animType: QuickAlertAnimType.scale,barrierDismissible: false);
        }

      },
      builder: (context, state) {
        return state.isLoading ?  const CustomLoadingWidget() :  const  UpdateMonthlyPlanCalenderWidget() ;
      },);
  }
}
