import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/cubit/monthly_plan_pending_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/cubit/state/monthly_plan_pending_state.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/screens/widget/monthly_plan_pending_error_widget.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/screens/widget/monthly_plan_pending_loaded_widget.dart';

class MonthlyPlanPendingBodyWidget extends StatelessWidget {
  const MonthlyPlanPendingBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MonthlyPlanPendingCubit, MonthlyPlanPendingRequestState>(
      listener: (context, state) {

        if(state is MonthlyPlanPendingLoadedWidget) {
          QuickAlert.show(context: context, type: QuickAlertType.success,text: "Success", autoCloseDuration: const Duration(seconds: 2));
        }
      },
      builder: (context, state) {
        return state.when(initial: () => const CustomLoadingWidget(), loading: () => const CustomLoadingWidget(), loaded: (data) => MonthlyPlanPendingLoadedWidget(pendingMonthlyPlanResponseModel: data), error: (e) => MonthlyPlanPendingErrorWidget(apiFailedModel: e));
      },
    ).withSymetricPadding(horizontalPadding: 5.w);
  }
}
