// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/core/extensions/month_extension.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/get/alert_response_model.dart';

import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/get/pending_monthly_plan_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/screens/view_monthly_plan_screen.dart';

import '../../../../../../common/common.dart';

class MonthlyPlanPendingCardWidget extends StatelessWidget {
  final PendingMonthlyPlan model;
  const MonthlyPlanPendingCardWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pop(context);

            if(context.mounted) {
                context.read<ViewMonthlyPlanCubit>().managerClickTrue();
             AlertModel alertModel = AlertModel(
              monthlyPlanId: model.monthlyPlanId,
               
             );
                            context.read<ViewMonthlyPlanCubit>().setAlertModelValue(alertModel);

              Navigator.push(context, SlideLeftRoute(screen: ViewMonthlyPlanScreen(monthlyPlanId: model.monthlyPlanId,)));

            }
           
          },
            leading: CircleAvatar(
              child: CommonTextWidget(
                title: model.userDTO!.userName.toString().substring(0, 2),
              )
            ),
            //  trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
            
            
            title: CommonTextWidget(title: "Monthly plan approval requested by ${model.userDTO!.userName} for ${model.month.toString().toMonthName} month",maxLines: 3,fontWeight: FontWeight.w500,),
            subtitle: CommonTextWidget(title: "Requested on ${DateFormat().add_yMMMd().format(DateTime.parse(model.createdDate.toString()))}",textColor: Colors.grey,textSize: 16.sp,fontWeight: FontWeight.w600,),
          ),
          5.verticalSpace,
          const Divider().withSymetricPadding(horizontalPadding: 14.w)
      ],
    );
  }
}
