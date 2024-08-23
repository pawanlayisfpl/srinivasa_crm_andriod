

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/view_monthly_plan_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/update_monthly_plan_date_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/state/update_monthly_plan_state.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/screen/widget/update_monthly_plan_customer_list_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/screen/widget/update_monthly_plan_kilometer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../cubit/update_monthly_plan_cubit.dart';

class UpdateMonthlyPlanCalenderWidget extends StatelessWidget {
  const UpdateMonthlyPlanCalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateMonthlyPlanCubit, UpdateMonthlyPlanState>(
      builder: (context, state) {
        return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),

            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         
         state.isMonhtlPlanLoaded == false  ? const  SizedBox.shrink() :   TableCalendar(
              weekNumbersVisible: false,
              weekendDays: const [DateTime.sunday],
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
              },
              calendarFormat: CalendarFormat.month,
              formatAnimationCurve: Curves.easeInOut,
              headerVisible: true,
              calendarStyle: const CalendarStyle(
                outsideDaysVisible: false,
                // Hide the focused date by setting a transparent decoration
                selectedDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
              formatAnimationDuration: const Duration(milliseconds: 300),
              focusedDay:   DateTime.parse(state.existingMonthlyPlanList.first.createdDate.toString()),
              firstDay: DateTime.parse(state.existingMonthlyPlanList.first.createdDate.toString()),
              lastDay: DateTime.parse(state.existingMonthlyPlanList.last.createdDate.toString()),
              enabledDayPredicate: (day) => day.weekday != DateTime.sunday,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              currentDay:DateTime.parse(state.existingMonthlyPlanList.first.createdDate.toString()),
              onDaySelected: (selectedDay, focusedDay) {
                bool dateExists = state.existingMonthlyPlanList.any((plan) => isSameDay(DateTime.parse(plan.createdDate.toString()), selectedDay));

                if(dateExists) {
                     showAdaptiveDialog(
                  barrierDismissible: true, 
                  
                  context: context, builder: (c) => AlertDialog.adaptive(title: Text("PLans Exits"),));

                }else {
                     showAdaptiveDialog(
                  barrierDismissible: true, 
                  
                  context: context, builder: (c) => AlertDialog.adaptive(title: Text("Creating New Plan"),));

                }
             
              },
              
              
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {

                  if(state.existingMonthlyPlanList.isNotEmpty) {
                    var dateExists = state.existingMonthlyPlanList.any((plan) => isSameDay(DateTime.parse(plan.createdDate.toString()), day));
                    return Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: dateExists  ? Colors.blueAccent : Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(color: dateExists  ? Colors.white : Colors.black),
                        ),
                      ),
                    );
                  }
                  return null;
                 
                },
              ),
            ),
          
            40.verticalSpace,
            CommonButton(
              callback: () {
                QuickAlert.show(context: context, type: QuickAlertType.warning,
                title: 'Update Plan',
                text: 'Are you sure you want to update the monthly plan?',
                
                animType: QuickAlertAnimType.scale,
                confirmBtnText: 'Yes',
                confirmBtnColor: AppColors.blackColor,
                onConfirmBtnTap: () {
                  Navigator.pop(context);
                  if(context.mounted) {
                    context.read<UpdateMonthlyPlanCubit>().updateMonthlyPlan();
                  }
                },
                cancelBtnText: 'No',
                showConfirmBtn: true,
                showCancelBtn: true
                
                );
              },
              title: "Submit Update Plan",
            ).withSymetricPadding(horizontalPadding: 20.w),
            20.verticalSpace,
          ],
        ));
      },
    );
  }
  
  showCreateDialog(BuildContext context, ViewDailyPlanModel viewDailyPlanModel) {

    
    if(context.mounted) {
      Navigator.pop(context);
    }

    if(context.mounted) {
      AlertDialog alertDialog = AlertDialog(
      content:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Expanded(child: CommonTextWidget(title: "Enter new plan details",fontWeight: FontWeight.bold,align: TextAlign.center,)),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              )
            ],
          ),
          const Divider(thickness: 2,color: AppColors.primaryColor,),
          10.verticalSpace,
          // DATE TEXT FIELD
          const UpdateMonthlyPlanDateTextFieldWidget(),
          15.verticalSpace,
          const UpdateMonthlyPlanKilometerTextWidget(),
          18.verticalSpace,
          const UpdateMonthlyPlanCustomerListDropDownWidget(),
          20.verticalSpace,
          CommonButton(callback: () {
            if(context.mounted) {
              Navigator.pop(context);
            }
            if(context.mounted) {
           context.read<UpdateMonthlyPlanCubit>().submitClicked();

            }
          }, title: "Submit"),
          18.verticalSpace,
        ],
      ),
      );
      showDialog(context: context, builder: (ctx) => alertDialog );
    }
  }
}
