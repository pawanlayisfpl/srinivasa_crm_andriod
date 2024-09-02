

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/view_monthly_plan_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_custoemer_list_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_date_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_kilometer_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/update_monthly_plan_date_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/model/post/update_monthly_plan_daily_plan_post_model.dart';
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
         
         state.isMonhtlPlanLoaded == false  ? const  SizedBox.shrink() : 
        TableCalendar(
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
  ),
  formatAnimationDuration: const Duration(milliseconds: 300),
  firstDay: DateTime.parse(state.existingMonthlyPlanList.first.createdDate.toString()),
lastDay: DateTime(
  DateTime.parse(state.existingMonthlyPlanList.last.createdDate.toString()).year,
  DateTime.parse(state.existingMonthlyPlanList.last.createdDate.toString()).month + 1,
  0
),  focusedDay: DateTime.parse(state.existingMonthlyPlanList.first.createdDate.toString()),
  enabledDayPredicate: (day) => day.weekday != DateTime.sunday,
  headerStyle: const HeaderStyle(
    formatButtonVisible: false,
    titleCentered: true,
  ),
  calendarBuilders: CalendarBuilders(
    defaultBuilder: (context, day, focusedDay) {
      var dateExists = state.existingMonthlyPlanList
          .any((plan) => isSameDay(plan.createdDate, day));
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: dateExists ? Colors.green : Colors.grey.shade200,
        ),
        child: Center(
          child: Text(
            '${day.day}',
            style: TextStyle(
                color: dateExists ? Colors.white : Colors.black),
          ),
        ),
      );
    },
  ),
  onDaySelected: (selectedDay, focusedDay) async {
    await handleOnDaySelected(selectedDay, context);
  },
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
                    context.read<UpdateMonthlyPlanCubit>().updateMonthlyPlan(context);
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
  Future<void> handleOnDaySelected(DateTime selectedDay, BuildContext context) async {
    bool dateExists = context.read<UpdateMonthlyPlanCubit>().state.existingMonthlyPlanList
        .any((plan) => isSameDay(DateTime.parse(plan.createdDate.toString()), selectedDay));

    debugPrint("Selected Day: $selectedDay");
    debugPrint("Date Exists: $dateExists");

    if (dateExists) {
      // UPDATE DAILY PLAN
        UpdateMonthlyDailyPlanPostModel exisitngModel = context.read<UpdateMonthlyPlanCubit>().state.existingMonthlyPlanList.where((e) => isSameDay(e.createdDate, selectedDay)).first;
        debugPrint(exisitngModel.toJson().toString());
      
        context.read<UpdateMonthlyPlanCubit>().reset();
      context.read<UpdateMonthlyPlanCubit>().onDateFieldChange(dateField: selectedDay.toString());
      UpdateMonthlyDailyPlanPostModel updateMonthlyDailyPlanPostModel = context.read<UpdateMonthlyPlanCubit>().state.existingMonthlyPlanList.where((e) => isSameDay(e.createdDate, selectedDay)).toList().first;
    debugPrint(updateMonthlyDailyPlanPostModel.toJson().toString());
    context.read<UpdateMonthlyPlanCubit>().onKiloMeterChange(value: updateMonthlyDailyPlanPostModel.approxKms.toString());
    context.read<UpdateMonthlyPlanCubit>().addToExistingSelectedCustomersList(updateMonthlyDailyPlanPostModel: updateMonthlyDailyPlanPostModel);
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (c) => AlertDialog(
              backgroundColor: Colors.white,
               shadowColor: Colors.grey.shade200,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              
             content: SingleChildScrollView(
               child: Column(mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: CommonTextWidget(title: 'Update plan',textSize: 22.sp,fontWeight: FontWeight.w500,align: TextAlign.left,).withSymetricPadding(horizontalPadding: 5.w)),
                       10.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade100,
                            child: const Icon(Icons.close,color: Colors.black,)),
                        ),
                        10.horizontalSpace,
                    ],
                  ),
                  const Divider(),
                  15.verticalSpace,
                  const UpdateMonthlyPlanDateTextFieldWidget(),
                  15.verticalSpace,
                  const UpdateMonthlyPlanKilometerTextWidget(),
                  15.verticalSpace,
                  const UpdateMonthlyPlanCustomerListDropDownWidget(),
                  20.verticalSpace,
                  CommonButton(callback: ()async  {
                    List<Customermodel> selectedCustomers = context.read<UpdateMonthlyPlanCubit>().state.selectedCustomersList;

                    if(selectedCustomers.isNotEmpty) {
                    context.read<UpdateMonthlyPlanCubit>().updatePlan(context,selectedDay);

                    }else {
                      Fluttertoast.showToast(msg: 'Please select customers');
                    }
                  }, title: 'Submit'),
                  10.verticalSpace,
                
               
                ],),
             ),),
        );
    } else {
      // CREATE DAILY PLAN
      context.read<UpdateMonthlyPlanCubit>().reset();
      context.read<UpdateMonthlyPlanCubit>().onDateFieldChange(dateField: selectedDay.toString());



        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (c) => AlertDialog(
              backgroundColor: Colors.white,
               shadowColor: Colors.grey.shade200,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              
             content: SingleChildScrollView(
               child: Column(mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: CommonTextWidget(title: 'Create new plan',textSize: 22.sp,fontWeight: FontWeight.w500,align: TextAlign.left,).withSymetricPadding(horizontalPadding: 5.w)),
                       10.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade100,
                            child: const Icon(Icons.close,color: Colors.black,)),
                        ),
                        10.horizontalSpace,
                    ],
                  ),
                  const Divider(),
                  15.verticalSpace,
                  const UpdateMonthlyPlanDateTextFieldWidget(),
                  15.verticalSpace,
                  const UpdateMonthlyPlanKilometerTextWidget(),
                  15.verticalSpace,
                  const UpdateMonthlyPlanCustomerListDropDownWidget(),
                  20.verticalSpace,
                  CommonButton(callback: ()async  {

                      List<Customermodel> selectedCustomers = context.read<UpdateMonthlyPlanCubit>().state.selectedCustomersList;

                    if(selectedCustomers.isNotEmpty) {
                     context.read<UpdateMonthlyPlanCubit>().addToExistingPlan(context);

                    }else {
                      Fluttertoast.showToast(msg: 'Please select customers');
                    }



                 
                  }, title: 'Submit'),
                  10.verticalSpace,
                
               
                ],),
             ),),
        );
    }
}
}
