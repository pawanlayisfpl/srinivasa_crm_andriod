import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/widgets/widgets.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/screens/alerts_screen.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/customer_dashboard_screen.dart';
import 'package:srinivasa_crm_new/src/features/Dashbaord/presentations/dashboard_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Kyc/presentation/screens/kyc_pending_screen.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/monthly_plan_dashboard_screen.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/sales_dashboard_screen.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/screens/user_activity_screen.dart';

import '../../../../config/animations/routes/all_animate_routes.dart';
import '../../../../config/config.dart';
import '../../../mark attendance/presentations/screens/mark_attendance_screen.dart';
import '../../domain/dashboard_model.dart';


class DashboardBodyWidget extends StatelessWidget {

  const DashboardBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
       const platform = MethodChannel('com.srinivasa.crm');

    return RefreshIndicator(
      backgroundColor: AppColors.primaryColor,
      color: Colors.white,
      onRefresh: () async {
      await  context.read<AlertCubit>().getAlertCountValue();
      },
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.verticalSpace,
          Row(
            children: [
              CommonTextWidget(title: '',fontWeight: FontWeight.bold,textColor: AppColors.primaryColor,textSize: 20.sp,),
              const Spacer(),
              InkWell(
                onTap: () {
                  
                  context.read<DashboardCubit>().toggleIsList();
                },
                child: Icon ( context.watch<DashboardCubit>().state ? Icons.grid_view_rounded :  Icons.view_list_sharp,color: AppColors.primaryColor,size: 30.sp,)),
            ],
          ).withSymetricPadding(horizontalPadding: 18.w),
          20.verticalSpace,
          // Expanded(
          //   child: Container(
          //     child: AnimatedSwitcher(
          //       transitionBuilder: (child, animation) => ScaleTransition(child: child, scale: animation),
                
          //       switchInCurve: Curves.easeIn,
          //       switchOutCurve: Curves.easeOut,
                    
          //       duration: const Duration(milliseconds: 600),
          //     child:context.watch<DashboardCubit>().state ? _buildListWidget(context) :  _buildGridListWidget(context),),
          //   ),
          // ),
        //  NORMAL LIST CHILDDDD
        context.watch<DashboardCubit>().state ? _buildListWidget(context) :  _buildGridListWidget(context)
          
        ],
      ),
      
      
    );
  }
  
  Widget _buildGridItem(BuildContext context, int index) {
    final DashboardModel dashboardModel = dashboardIconLists[index];

    return InkWell(
      onTap: () {
        navigateToPage(context, index);
      },
      splashColor: AppColors.primaryColor,
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.25, // Each child takes 50% of the screen width
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
                
                Hero(
                  tag: dashboardIconLists[index].iconName,
                  child: Image.asset(
                    dashboardModel.iconPath,
                    height: 60.0,
                    width: 60.0,
                    fit: BoxFit.cover,
                  ),
                ),
              context.watch<AlertCubit>().alertCount != 0 && dashboardModel.isAlert == true  ?   Positioned(
                  right: 0,
                  top: 6,
                  child: CircleAvatar(
                  backgroundColor: AppColors.redColor,
                  radius: 13.0,
                  child: CommonTextWidget(title: context.watch<AlertCubit>().alertCount.toString(),textColor: Colors.white,textSize: 12.sp,),
                )) : const SizedBox.shrink(),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              dashboardModel.iconName,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  navigateToPage(context, index) async {
    switch (index) {
      case 0:
      // customer dashboard
        Navigator.push(context, SlideRightRoute(screen: const CustomerDashbaordScreen()));
      case 1:
                Navigator.push(context, ScaleRoute(screen: const MonthlyPlanDashboardScreen()));

      case 2:
      // ALERTS
                      Navigator.push(context, SlideLeftRoute(screen: const AlertsScreen()));


      

      case 3:
     Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => const MarkAttendanceScreen(
                  isCheckedInScreen: false,
                    )));

      case 4:
      // kyc list
      Navigator.push(context, SlideRightRoute(screen: const KycPendingScreen()));

      case 5:
          Navigator.push(context, SlideRightRoute(screen: const SalesOrderDashboardScreen()));

    //  await   Workmanager().registerOneOffTask("2","background" );
    // await Workmanager().registerPeriodicTask("backgroun", 'background',constraints: Constraints(networkType: NetworkType.connected,requiresBatteryNotLow: false,requiresDeviceIdle: false,requiresStorageNotLow: false,requiresCharging: false),frequency: const Duration(minutes: 15));
    //   // REPORTS
    //         Fluttertoast.showToast(msg: 'Backend api not available');

      case 6:
      Navigator.push(context, ScaleRoute(screen: const UserActivityScreen()));

     

      default:
        return Navigator.pushNamed(context, "unknown");
    }
  }
  
    _buildListWidget(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      // padding: EdgeInsets.only(top: 10.h),
      itemBuilder: (c,i) {
      return ListTile(
        onTap: () => navigateToPage(context, i),
        splashColor: AppColors.primaryColor,
        trailing: Hero(tag: dashboardIconLists[i].iconName,
        child: Image.asset(dashboardIconLists[i].iconPath,fit: BoxFit.fitHeight,height: 40.h,width: 40.w,)),
        title: CommonTextWidget(title: dashboardIconLists[i].iconName.toString(),fontWeight: FontWeight.w600,),);
    },itemCount: dashboardIconLists.length, separatorBuilder: (BuildContext context, int index) { return const Divider(); },).withSymetricPadding(horizontalPadding: 10.w);
  }
  
  _buildGridListWidget(BuildContext context) {
    return GridView.builder(
               shrinkWrap: true,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 childAspectRatio:0.9,
                 crossAxisCount: 3, // Number of columns
                 crossAxisSpacing: 16.0, // Spacing between columns
                 mainAxisSpacing: 16.0, // Spacing between rows
               ),
               itemCount: dashboardIconLists.length,
               itemBuilder: (context, index) {
                 return _buildGridItem(context, index);
               },
             ).withSymetricPadding(horizontalPadding: 10.w);
  }
}