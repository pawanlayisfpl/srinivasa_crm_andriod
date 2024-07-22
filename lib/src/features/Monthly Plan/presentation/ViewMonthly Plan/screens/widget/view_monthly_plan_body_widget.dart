
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_state.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/screens/widget/monthly_plan_card_widget.dart';



class ViewMonthlyPlanBodyWidget extends StatelessWidget {
  const ViewMonthlyPlanBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewMonthlyPlanCubit, ViewMonthlyPlanState>(
      builder: (context, state) {
       
        return state.when(initial: () => const Center(child: Text('View  Monthly plan state screen'),), loading: () => const CustomLoadingWidget(), loaded: (r) {
          return  r.viewDailyPlanModel == null ? EmptyWidget(title: 'No Plans found', callback: () {}) :
          //  context.watch<ViewMonthlyPlanCubit>().alertModel != null && r.approvalStatus == "APPROVED" || r.approvalStatus == "REJECTED" ? Center(child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //   CommonTextWidget(title: "You have already ${r.approvalStatus == 'APPROVED' ? "Approved" : r.approvalStatus == "REJECTED" ? "Rejected" : "Submitted"} this monthly plan",maxLines: 4,fontWeight: FontWeight.w500,),
          //   20.verticalSpace,
          //   CommonButton(callback: () {
          //     Navigator.pop(context);
          //   }, title: 'Go Back')
          // ],),).withSymetricPadding(horizontalPadding: 20.w) : 
          
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (c,i) {
                  return MonthlyPlanCardWidget(model: r.viewDailyPlanModel![i], monthlyPlanModel: r,);
                },itemCount: r.viewDailyPlanModel!.length,),
              ),
         context.watch<ViewMonthlyPlanCubit>().isManagarClicked == false ? const SizedBox.shrink() :     10.verticalSpace,
         context.watch<ViewMonthlyPlanCubit>().isManagarClicked == false ? const SizedBox.shrink() :     CommonButton(callback: () => approveBtnClicked(context), title: "Approve",isApproveButton: true,).withSymetricPadding(horizontalPadding: 10.w),
        context.watch<ViewMonthlyPlanCubit>().isManagarClicked == false ? const SizedBox.shrink() :      10.verticalSpace,
        context.watch<ViewMonthlyPlanCubit>().isManagarClicked == false ? const SizedBox.shrink() :      CommonButton(callback: ()  => rejectBtnClicked(context), title: "Reject",isRejectButton: true,).withSymetricPadding(horizontalPadding: 10.w),
                context.watch<ViewMonthlyPlanCubit>().isManagarClicked == false ? const SizedBox.shrink() :      10.verticalSpace,

            ],
          );
        }, error: (e) => CommonErrorWidget(error: e.errorMessage.toString(), callback: () {}));
      },
    );
  }
  
  approveBtnClicked(BuildContext context) {
    if(context.mounted) {
      QuickAlert.show(context: context, type: QuickAlertType.success
      ,text: "Are you sure want to approve?",
      title: "Approve",
      barrierDismissible: false,
      animType: QuickAlertAnimType.slideInUp,
      showCancelBtn: true,
      confirmBtnColor: AppColors.blackColor,
      onConfirmBtnTap: () {
        Navigator.pop(context);
        if(context.mounted) {
        context.read<ViewMonthlyPlanCubit>().approveMonthlyPlan(context: context);

        }
      },
      );
      
    }
  }
  
  rejectBtnClicked(BuildContext context) {
      if(context.mounted) {
         QuickAlert.show(context: context, type: QuickAlertType.error
          ,text: "Are you sure want to reject monthly plan?",
          title: "Reject",
          animType: QuickAlertAnimType.slideInUp,
          showCancelBtn: true,
          confirmBtnColor: AppColors.blackColor,
          onConfirmBtnTap: () {
        Navigator.pop(context);
            if(context.mounted) {
            showRejectReasonDialog(context);


            }
          },
           barrierDismissible: false
          
          
          );
      }
  }
  
  void showRejectReasonDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      barrierLabel: "Reject Reason",
      
      
      context: context, builder: (alertCtx) {
      return AlertDialog(
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        
        backgroundColor: Colors.white,
        scrollable: true,
        shadowColor: Colors.grey,
        title: Row(
          children: [
            Expanded(child: const Text('Reject Reason')),
            IconButton(onPressed: () {
              Navigator.pop(alertCtx);

            }, icon: Icon(Icons.close))
          ],
        ),
        content: TextField(
          maxLines: 4,
          cursorColor: AppColors.primaryColor,

          keyboardType: TextInputType.multiline,
          controller: context.read<ViewMonthlyPlanCubit>().rejectReasonController,
          decoration: const InputDecoration(
            
            
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder( 
              borderSide: BorderSide(color: AppColors.primaryColor)


            ),
            hintText: 'Enter reason for rejecting the monthly plan'
          ),
        ),
        actions: [
        
        CommonButton(callback: () {
          Navigator.pop(alertCtx);

          if(alertCtx.mounted) {
            if(context.read<ViewMonthlyPlanCubit>().rejectReasonController.text.isNotEmpty) {
              if(alertCtx.mounted) {
              context.read<ViewMonthlyPlanCubit>().rejectMonthlyPlan(context: context);

              }
            }else {
              Fluttertoast.showToast(msg: "Please selefc reason for rejecting the monthly plan");
            }
          }
        }, title: "Submit")
        ],
      );
    });
  }
}
