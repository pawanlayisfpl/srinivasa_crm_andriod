// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';

import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/pending_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/cubit/monthly_plan_pending_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/screens/widget/monthlyplan_pending_card_widget.dart';

class MonthlyPlanPendingLoadedWidget extends StatelessWidget {
  final PendingMonthlyPlanResponseModel pendingMonthlyPlanResponseModel;
  const MonthlyPlanPendingLoadedWidget({
    super.key,
    required this.pendingMonthlyPlanResponseModel,
  });

  @override
  Widget build(BuildContext context) {
    return pendingMonthlyPlanResponseModel.pendingMonthlyPlans == null ? EmptyWidget(title: "No pending request found..", callback: () async {
     await context.read<MonthlyPlanPendingCubit>().getPendingRequests();
    }) : AnimationLimiter(child: ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      itemBuilder: (c,i) {
        PendingMonthlyPlan model = pendingMonthlyPlanResponseModel.pendingMonthlyPlans![i];
      return AnimationConfiguration.staggeredList(position: i, child: SlideAnimation(duration: const Duration(milliseconds: 600),curve: Curves.ease,verticalOffset: 20, child: FadeInAnimation(curve: Curves.linear,duration: const Duration(milliseconds: 600),child: MonthlyPlanPendingCardWidget(model: model),),));
    },itemCount: pendingMonthlyPlanResponseModel.pendingMonthlyPlans != null ? pendingMonthlyPlanResponseModel.pendingMonthlyPlans!.length : 0,));
  }
}
