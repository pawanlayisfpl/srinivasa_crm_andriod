
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/post/mark_alert_as_read_postmodel.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/screens/alert_details_screen.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/screens/view_monthly_plan_screen.dart';
import 'package:srinivasa_crm_new/src/features/Profile/domain/model/profile_model.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart';

import '../../../../../config/constants/app_colors.dart';
import '../../../domain/model/get/alert_response_model.dart';
import '../../cubit/alert_cubit.dart';

class AlertCardWidget extends StatelessWidget {
 final AlertModel alertModel;
  const AlertCardWidget({
    Key? key,
    required this.alertModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shadowColor: Colors.grey.shade200,
          color: Colors.white,

          shape: RoundedRectangleBorder(
            
            borderRadius: BorderRadius.circular(4.0),

          ),
          elevation: 4.0, // Adjust the elevation for desired shadow intensity
          child: ListTile(
            onLongPress: () {
              context.read<ViewMonthlyPlanCubit>().managerClickTrue();
                            context.read<ViewMonthlyPlanCubit>().setAlertModelValue(alertModel);

              Navigator.push(context, SlideLeftRoute(screen: ViewMonthlyPlanScreen(monthlyPlanId: alertModel.monthlyPlanId,)));
            },
            onTap: ()async  {

                if(context.mounted) {

                MarkAlertAsReadPostModel markAlertAsReadPostModel = MarkAlertAsReadPostModel(notificationId: alertModel.notificationId);
                context.read<AlertCubit>().markAsRead(markAlertReadPostModel: markAlertAsReadPostModel);

              }

            
              ProfileModel? profileModel = context.read<ProfileCubit>().state.maybeMap(orElse: ()=> null,loadedLocal: (data) => data.profileResponseModel);
              
              if(profileModel != null && profileModel.userModel!.authorities!.first.roleId != 79 && alertModel.isDailyPlan == false) {
                                              debugPrint('PROFILE MODEL IS  FOUNDDDDD');

                                    context.read<ViewMonthlyPlanCubit>().managerClickTrue();

              context.read<ViewMonthlyPlanCubit>().setAlertModelValue(alertModel);

                if(context.mounted) {
                                                Navigator.push(context, SlideLeftRoute(screen: ViewMonthlyPlanScreen(monthlyPlanId: alertModel.monthlyPlanId,)));

                }
              }else {
                debugPrint('PROFILE MODEL IS NULL');
                  if(context.mounted) {
                
                Navigator.push(context, SlideRightRoute(screen: AlertDetailsScreen(alertModel: alertModel,) ));
              }

              }
              
            

              
              

            
            },
            title: CommonTextWidget(title: alertModel.message ?? "No message found", maxLines: 3,fontWeight: FontWeight.w500,),
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
    ).withSymetricPadding(horizontalPadding: 8.w);
  }
}
