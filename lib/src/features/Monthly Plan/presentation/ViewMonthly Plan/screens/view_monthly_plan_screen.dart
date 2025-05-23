// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/connection/internet_checker.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/cubit/daily_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/screens/widgets/dp_customer_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/screens/widgets/dp_date_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/screens/widgets/dp_kilometer_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/screen/update_monthly_plan_screen.dart';

import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart';

import '../../../../../config/config.dart';
import '../../Daily Plan/cubit/state/daily_plan_state.dart';
import 'widget/view_monthly_plan_body_widget.dart';

class ViewMonthlyPlanScreen extends StatefulWidget {
  final String? selectedDate;
  final int? monthlyPlanId;

  const ViewMonthlyPlanScreen({
    super.key,
    this.selectedDate,
    this.monthlyPlanId,
  });

  @override
  State<ViewMonthlyPlanScreen> createState() => _ViewMonthlyPlanScreenState();
}

class _ViewMonthlyPlanScreenState extends State<ViewMonthlyPlanScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((c) async {
      widget.selectedDate != null
          ? context
              .read<ViewMonthlyPlanCubit>()
              .getAllMonthlyPlanData(selectedDate: widget.selectedDate ?? "")
          : null;

      if (widget.monthlyPlanId != null) {
        context.read<ViewMonthlyPlanCubit>().getAllMonthlyPlanByMonthlyPlanID(
            id: int.parse(widget.monthlyPlanId.toString()));
         context.read<DailyPlanCubit>().getAllInitialValues();   
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Monthly Plan'),
          actions: [
           context.watch<ViewMonthlyPlanCubit>().state.maybeMap(orElse: () => const SizedBox.shrink(),loading: (value) => const SizedBox.shrink(),loaded: (data) => 
           
          data.monthlyPlanLists.dailyPlans!.isNotEmpty ? DateTime.parse(data.monthlyPlanLists.dailyPlans!.first.planDate.toString()).month.toString() == DateTime.now().month.toString() && data.monthlyPlanLists.approvalStatus!.toLowerCase().toString() != "pending" ?
        
            BlocBuilder<DailyPlanCubit, DailyPlanState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () async {
                    final results = await locator.get<InternetChecker>().hasInternet();

                    if(results) {
                       context.read<DailyPlanCubit>().resetState();
                    AlertDialog alertDialog = AlertDialog(
                      backgroundColor: Colors.white,
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                CommonTextWidget(
                                  title: 'Create Plan',
                                  fontWeight: FontWeight.bold,
                                  align: TextAlign.center,
                                  textSize: 24.sp,
                                  textColor: AppColors.primaryColor,
                                ),
                                const Spacer(),
                                CircleAvatar(
                                  backgroundColor: AppColors.primaryColor,
                                  child: IconButton(
                                      onPressed: () {
                                        
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                            const Divider(
                              color: AppColors.primaryColor,
                            ),
                            20.verticalSpace,
                            // DateField
                            const DaiilyPlanDateTextField(),
                            20.verticalSpace,
                            const DailyPlanKilometerTextField(),
                            20.verticalSpace,
                            const DailyPlanCustomerListDropdownWidget(),
                            20.verticalSpace,
                            CommonButton(callback: () async {
                              int monthlyPlanId = widget.monthlyPlanId ?? 0;
                              context.read<DailyPlanCubit>().submit(context: context, monthlyPlanId: monthlyPlanId, isConfirmed: false, voidCallback: () async {
                                await context.read<ViewMonthlyPlanCubit>().getAllMonthlyPlanByMonthlyPlanID(id: widget.monthlyPlanId ?? 0);
                                });
                            }, title: 'Submit')
                          ],
                        ),
                      ),
                    );
                    showDialog(
                        useSafeArea: true,
                        barrierDismissible: false,
                        context: context,
                        builder: (c) => alertDialog);

                    }else {
                      // WHEN INTERNET IS NOT AVAILABLE

                    if(context.mounted) {
                      QuickAlert.show(context: context, type: QuickAlertType.warning,animType: QuickAlertAnimType.slideInDown,
                      title: 'No Internet',
                      text: 'Internet is requried to use this feature',
                      confirmBtnColor: Colors.black
                      );
                    }
                    }
                   
                  },
                  icon: const Icon(Icons.create),
                );
              },
            ) : 
            DateTime.parse(data.monthlyPlanLists.dailyPlans!.first.planDate.toString()).month.toString() != DateTime.now().month.toString() && data.monthlyPlanLists.approvalStatus!.toLowerCase().toString() != "approved" ?
            
              IconButton(onPressed: () {
              if(context.mounted) {
                QuickAlert.show(context: context, type: QuickAlertType.confirm,animType: QuickAlertAnimType.slideInDown,title: 'Update Plan',confirmBtnText: 'Yes',confirmBtnColor: Colors.black,onConfirmBtnTap: () {
                  if(Navigator.canPop(context)) {
                    Navigator.pop(context);
                    if(context.mounted) {
                      Navigator.push(context, ScaleRoute(screen: UpdateMonthlyPlanScreen(id: widget.monthlyPlanId))); 
                    }
                  }
                },);
              }
            }, icon: const Icon(Icons.edit)) : const SizedBox.shrink() : const SizedBox.shrink(),)
          ],
        ),
        body:  SafeArea(child: ViewMonthlyPlanBodyWidget(id: widget.monthlyPlanId ?? -1,)));
  }
}
