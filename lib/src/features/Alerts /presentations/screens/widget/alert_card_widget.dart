
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_strings.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/screens/alert_details_screen.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/screen/update_monthly_plan_screen.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/screens/view_monthly_plan_screen.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Particular/screens/paticular_sales_order_screen.dart';

import '../../../../../config/constants/app_colors.dart';
import '../../../domain/model/get/alert_response_model.dart';
import '../../../domain/model/post/mark_alert_as_read_postmodel.dart';
import '../../cubit/alert_cubit.dart';

class AlertCardWidget extends StatelessWidget {
 final AlertModel alertModel;
  const AlertCardWidget({
    Key? key,
    required this.alertModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
           
            Card(
              shadowColor: Colors.grey.shade200,
              color: Colors.white,
        
              shape: RoundedRectangleBorder(
                
                borderRadius: BorderRadius.circular(4.0),
        
              ),
              elevation: 4.0, // Adjust the elevation for desired shadow intensity
              child: ListTile(
               
                onTap: ()async  {
                  
                  final results = await locator.get<InternetChecker>().hasInternet();
                //  TODO: FOR EMULATOR TESTING (!) ADDED THIS
                  if(!results) {
                     debugPrint(alertModel.toJson().toString());
                      if(context.mounted) {
                      
                    MarkAlertAsReadPostModel markAlertAsReadPostModel = MarkAlertAsReadPostModel(notificationId: alertModel.notificationId);
                    context.read<AlertCubit>().markAsRead(markAlertReadPostModel: markAlertAsReadPostModel);
                      
                  }
                      
                  if(alertModel.notificationType == AppStrings.salesOrderType) {
                    switch(alertModel.type ) {
                      case AppStrings.created :
                      Navigator.push(context, ScaleUpRoute(screen: ParticularSalesOrderScreen(orderId: alertModel.notificationTypeId ?? 0, isApproveOrRejectEnabled: true,)));
                      break;
                      case AppStrings.approved :
                      Navigator.push(context, ScaleUpRoute(screen: AlertDetailsScreen(alertModel: alertModel,)));
                      break;
                      case AppStrings.rejected :
                      Navigator.push(context, ScaleUpRoute(screen: AlertDetailsScreen(alertModel: alertModel,)));
                      break;
                      case AppStrings.updated :
                      Navigator.push(context, ScaleUpRoute(screen: AlertDetailsScreen(alertModel: alertModel,)));
                      break;
                      default : 
                      Navigator.push(context, ScaleUpRoute(screen: AlertDetailsScreen(alertModel: alertModel,)));
                    }
                      
                    return;
                  }else {
                    debugPrint('NOT A SALES ORDER');
                      switch(alertModel.type) {
                  case AppStrings.rejected:
                  Navigator.push(context, SlideLeftRoute(screen: UpdateMonthlyPlanScreen(
                    id: alertModel.monthlyPlanId,
                    comments: alertModel.message
                  )));
                  break;
                  case AppStrings.approved: 
                  context.read<ViewMonthlyPlanCubit>().managerClickedFalse();
                  context.read<ViewMonthlyPlanCubit>().resetAlertModelValue();
                  Navigator.push(context, SlideLeftRoute(screen: ViewMonthlyPlanScreen(monthlyPlanId: alertModel.monthlyPlanId,)));
                  break;
                  case AppStrings.created :
                  if(alertModel.type == "CREATED") {

                    if(alertModel.notificationType != AppStrings.dailyPlanType) {
 context.read<ViewMonthlyPlanCubit>().managerClickTrue();
                                context.read<ViewMonthlyPlanCubit>().setAlertModelValue(alertModel);
                                Navigator.push(context, ScaleRoute(screen: ViewMonthlyPlanScreen(monthlyPlanId: alertModel.monthlyPlanId,)));
                    }else {
                                          Navigator.push(context, SlideRightRoute(screen: AlertDetailsScreen(alertModel: alertModel,) ));

                    }
                   

                  }
                  
                       
                      
                  break;
                  case   AppStrings.updated:
                      
                  if(alertModel.notificationType != AppStrings.dailyPlanType) {
                       context.read<ViewMonthlyPlanCubit>().managerClickTrue();
                                context.read<ViewMonthlyPlanCubit>().setAlertModelValue(alertModel);
                      
                      
                  Navigator.push(context, SlideLeftRoute(screen: ViewMonthlyPlanScreen(monthlyPlanId: alertModel.monthlyPlanId, )));
                  }else {
                    Navigator.push(context, SlideRightRoute(screen: AlertDetailsScreen(alertModel: alertModel,) ));

                  }
                  break;
                  default : 
                  Navigator.push(context, SlideRightRoute(screen: AlertDetailsScreen(alertModel: alertModel,) ));
                      
                }
                  }

                  }else {
                    Navigator.push(context, ScaleRoute(screen: AlertDetailsScreen(alertModel: alertModel)));
                  }
                  
                 
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                       5.verticalSpace,
                   Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: alertModel.notificationType == AppStrings.salesOrderType ? AppColors.primaryColor :  alertModel.notificationType == AppStrings.dailyPlanType ? Colors.brown : AppColors.orangeColor),
            child: CommonTextWidget(title: alertModel.notificationType == AppStrings.salesOrderType ? "Sales Order" : alertModel.notificationType == AppStrings.dailyPlanType ? "Daily Plan" : "Monthly Plan",textColor: Colors.white,fontWeight: FontWeight.w500,)).withPadding(left: 0.w),
            5.verticalSpace,
                    CommonTextWidget(title: alertModel.message ?? "No message found", maxLines: 3,fontWeight: FontWeight.w500,),
                  ],
                ),
                subtitle: Text(alertModel.createdDate == null ? "No date found" : "Created on " + DateFormat('dd/MM/yyyy').format(DateTime.parse(alertModel.createdDate.toString())),style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w400),),
                trailing: alertModel.read != null && alertModel.read == false ? SizedBox(
                  height: 10,
                  width: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                      shape: BoxShape.circle
                    
                    ),
                  )
                ) : const SizedBox.shrink(),
              ),
            ),
            5.verticalSpace,
            const Divider(color: Colors.grey,thickness: 1,),
            5.verticalSpace
          ],
        ).withSymetricPadding(horizontalPadding: 8.w),
      
      ],
    );
  }
}
