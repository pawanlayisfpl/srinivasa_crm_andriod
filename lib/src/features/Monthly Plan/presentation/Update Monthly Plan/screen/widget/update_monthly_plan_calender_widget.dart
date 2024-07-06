
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/view_monthly_plan_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_custoemer_list_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_date_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_kilometer_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/update_monthly_plan_date_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/state/update_monthly_plan_state.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/screen/widget/update_monthly_plan_customer_list_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/screen/widget/update_monthly_plan_kilometer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../domain/model/get/monthly_plan_customer_model.dart';
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
            // const SizedBox(height: 20),
            // const Text('Update your monthly plan'),
            // const SizedBox(height: 20),
         state.isMonhtlPlanLoaded == false  ? SizedBox.shrink() :   TableCalendar(
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
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(DateTime.parse(state.createdDailyPlanList.first.planDate.toString()).year, DateTime.parse(state.createdDailyPlanList.first.planDate.toString()).month, 1),
              lastDay: DateTime.utc(DateTime.parse(state.createdDailyPlanList.first.planDate.toString()).year, DateTime.parse(state.createdDailyPlanList.first.planDate.toString()).month + 1, 0),
              enabledDayPredicate: (day) => day.weekday != DateTime.sunday,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              currentDay: DateTime.now(),
              onDaySelected: (selectedDay, focusedDay) {
                                    var dateExists = state.createdDailyPlanList.any((plan) => isSameDay(DateTime.parse(plan.planDate.toString()), selectedDay));

                if(dateExists) {
                  ViewDailyPlanModel viewDailyPlanModel = state.createdDailyPlanList.where( ( data) => isSameDay(DateTime.parse(data.planDate.toString()), selectedDay)).first;
                  List<MonthlyPlanCustomerModel> generatedCustomerModelList = [];
                  for (int i =0; i< viewDailyPlanModel.viewDailyPlanCustomers!.length;i++) {
                      MonthlyPlanCustomerModel monthlyPlanCustomerModel = MonthlyPlanCustomerModel(
                        checkinLocation: viewDailyPlanModel.viewDailyPlanCustomers![i].customer!.checkinLocation,
                        checkoutLocation: viewDailyPlanModel.viewDailyPlanCustomers![i].customer!.checkoutLocation,
                        customerAddress: viewDailyPlanModel.viewDailyPlanCustomers![i].customer!.customerAddress,
                        customerAlternateContactNumber: viewDailyPlanModel.viewDailyPlanCustomers![i].customer!.customerAlternateContactNumber,
                        customerContactNumber: viewDailyPlanModel.viewDailyPlanCustomers![i].customer!.customerContactNumber,
                        customerEmail: viewDailyPlanModel.viewDailyPlanCustomers![i].customer!.customerEmail,
                        customerName: viewDailyPlanModel.viewDailyPlanCustomers![i].customer!.customerName,
                        customerCity: viewDailyPlanModel.viewDailyPlanCustomers![i].customer!.customerCity,
                        customerState: viewDailyPlanModel.viewDailyPlanCustomers![i].customer!.customerState,
                        customerCategory: viewDailyPlanModel.viewDailyPlanCustomers![i].customer!.customerCategory,
                        customerCode: viewDailyPlanModel.viewDailyPlanCustomers![i].customer!.customerCode,
                        status: viewDailyPlanModel.viewDailyPlanCustomers![i].customer!.status,

                      );
                      generatedCustomerModelList.add(monthlyPlanCustomerModel);

                  }
                  context.read<UpdateMonthlyPlanCubit>().onDateFieldChange(dateField: viewDailyPlanModel.planDate.toString());
                  context.read<UpdateMonthlyPlanCubit>().onKiloMeterChange(value: viewDailyPlanModel.approxKms.toString());
                  context.read<UpdateMonthlyPlanCubit>().setSelectedCustomerLists(selectedCustomers: generatedCustomerModelList);

                  if(context.mounted) {
                   AlertDialog alertDialog = AlertDialog(
                     shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
    content: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,mainAxisSize: MainAxisSize.min,children: [
       Row(
      children: [
        Expanded(child: Center(child: CommonTextWidget(title: "Update Daily Plan",fontWeight: FontWeight.w400,textSize: 20.sp,))),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        )
      ],
    ),
       10.verticalSpace,
                              const Divider(
                                color: AppColors.primaryColor,
                                height: 4,
                                thickness: 2,
                              ),
                              10.verticalSpace,
                                Row(
                                children: [
                                  const Expanded(
                                      flex: 4,
                                      child: CommonTextWidget(
                                        title: "Date : ",
                                        align: TextAlign.end,
                                      )),
                                  Expanded(
                                      flex: 6,
                                      child: CommonTextWidget(
                                        title: " ${DateFormat('dd-MMMM-yyyy')
                                                .format(DateTime.parse(viewDailyPlanModel.planDate.toString()))}",
                                        align: TextAlign.start,
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                              10.verticalSpace,
                                Row(
                                children: [
                                  const Expanded(
                                      flex: 4,
                                      child: CommonTextWidget(
                                        title: "Kilometers : ",
                                        align: TextAlign.end,
                                      )),
                                  Expanded(
                                      flex: 6,
                                      child: CommonTextWidget(
                                        title: " ${double.parse(viewDailyPlanModel.approxKms
                                                    .toString())} KM",
                                        align: TextAlign.start,
                                        fontWeight: FontWeight.bold,
                                        maxLines: 3,
                                      ))
                                ],
                              ),
                              10.verticalSpace,
                               Row(
                                children: [
                                  const Expanded(
                                      flex: 4,
                                      child: CommonTextWidget(
                                        title: "Customers : ",
                                        align: TextAlign.end,
                                      )),
                                  Expanded(
                                    flex: 6,
                                    child: CommonTextWidget(
                                      title: " ${viewDailyPlanModel.viewDailyPlanCustomers!
                                              .map((e) => e.customer!.customerName)
                                              .join(",\n")}",
                                      align: TextAlign.start,
                                      fontWeight: FontWeight.bold,
                                      maxLines: 5,
                                    ),
                                  )
                                ],
                              ),
                              10.verticalSpace,
                              CommonButton(callback: () => showCreateDialog(context,viewDailyPlanModel), title: "Update")


    ],), // Assuming CreateDailyScreen is a StatelessWidget or StatefulWidget
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
                  }

                }else {
                  Fluttertoast.showToast(msg: 'No plan for this date');
                }
              },
              
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  if (state.viewMonthlyPlanModel != null) {
                    var dateExists = state.viewMonthlyPlanModel?.viewDailyPlanModel?.any((plan) => isSameDay(DateTime.parse(plan.planDate.toString()), day));
                    return Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: dateExists != null ? Colors.blueAccent : null,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(color: dateExists != null ? Colors.white : Colors.black),
                        ),
                      ),
                    );
                  }
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
