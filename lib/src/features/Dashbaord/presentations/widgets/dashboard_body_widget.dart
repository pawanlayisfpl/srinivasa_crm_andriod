import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/widgets/widgets.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/screens/alerts_screen.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/monthly_plan_dashboard_screen.dart';

import '../../../../config/animations/routes/all_animate_routes.dart';
import '../../../../config/config.dart';
import '../../../Monthly Plan/presentation/ViewMonthly Plan/screens/view_monthly_plan_screen.dart';
import '../../../mark attendance/presentations/screens/mark_attendance_screen.dart';
import '../../domain/dashboard_model.dart';


class DashboardBodyWidget extends StatelessWidget {
  const DashboardBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9,
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 16.0, // Spacing between columns
          mainAxisSpacing: 16.0, // Spacing between rows
        ),
        itemCount: dashboardIconLists.length,
        itemBuilder: (context, index) {
          return _buildGridItem(context, index);
        },
      ).withSymetricPadding(horizontalPadding: 10.w, verticalPadding: 20.h),
    );
  }
  
  Widget _buildGridItem(BuildContext context, int index) {
    final DashboardModel dashboardModel = dashboardIconLists[index];

    return InkWell(
      onTap: () {
        navigateToPage(context, index);
      },
      splashColor: AppColors.primaryColor.withOpacity(0.5),
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.5, // Each child takes 50% of the screen width
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Stack(
              children: [
                
                Image.asset(
                  dashboardModel.iconPath,
                  height: 120.0,
                  width: 120.0,
                  fit: BoxFit.cover,
                ),
              context.watch<AlertCubit>().alertCount != 0 && dashboardModel.isAlert == true  ?   Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                  backgroundColor: AppColors.redColor,
                  radius: 20.0,
                  child: CommonTextWidget(title: context.watch<AlertCubit>().alertCount.toString(),textColor: Colors.white,),
                )) : SizedBox.shrink(),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              dashboardModel.iconName,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  navigateToPage(context, index) async {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, Routes.customerDashbaordScreen);
      case 1:
                Navigator.push(context, ScaleRoute(screen: MonthlyPlanDashboardScreen()));

      case 2:
                      Navigator.push(context, ScaleRoute(screen: AlertsScreen()));


      

      case 3:
     Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => const MarkAttendanceScreen(
                  isCheckedInScreen: false,
                    )));

      case 4:
     

      default:
        return Navigator.pushNamed(context, "unknown");
    }
  }
}