import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/create_daily_plan_screen.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/create_monthly_plan_screen.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20Search/screen/monthly_plan_search_screen.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/screens/view_months_screen.dart';
import 'package:srinivasa_crm_new/src/features/Profile/presentations/cubit/profile_cubit.dart';

import '../../../../shared/widgets/dashboard_card_widget.dart';
import 'Monthly Plan PendingRequests/screens/monthly_plan_pending_request_screen.dart';

class MonthlyPlanDashboardScreen extends StatelessWidget {
  const MonthlyPlanDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> cardNames = [
      // 'Create Daily Plan',
      'Create Monthly Plan',
      'View Monthly Plan',
      'Search Monthly Plan',
      'Monthly Plan\n Pending Requests'


    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Plan'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05.sw), // 5% padding
        child: Center(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: context.watch<ProfileCubit>().state.maybeMap(orElse: () => cardNames.length,loadedLocal: (data) => data.profileResponseModel.userModel!.roleId.toString() !=  AppStrings.salesRepRole ? cardNames.length -2 : cardNames.length),
              itemBuilder: (c, i) {
                return GestureDetector(
                    onTap: () {
                      switch (i) {
                        case 2:
                        Navigator.push(context, SlideLeftRoute(screen: const MonthlyPlanSearchScreen()));
                      
                          break;
                        case 0:
                        // Fluttertoast.showToast(msg: "Add Customer Feature is disabled");
                            Navigator.push(context, SlideLeftRoute(screen: const CreateMonthlyPlanScreen()));
                       
                          break;
                        case 1:
                              Navigator.push(
                              context, ScaleRoute(screen: const ViewMonthsScreen()));
                          break;

                       case 3: 
                          Navigator.push(
                              context, ScaleRoute(screen: const MonthlyPlanPendingRequestScreen()));
                          break;   
                      }
                    },
                    child: DashboardChildrenCardWidget(
                      title: cardNames[i],
                    ));
              }),
        ),
      ),
    );
  }
}
