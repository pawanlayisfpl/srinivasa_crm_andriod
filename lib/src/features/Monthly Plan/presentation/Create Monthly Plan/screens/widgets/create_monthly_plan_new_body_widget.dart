import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/monthly_plan_post_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/post/update_monthlyplan_postmodel.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_custoemer_list_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_date_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/screens/widgets/monthly_plan_kilometer_textfield.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../common/common.dart';
import '../../cubit/create_monthly_plan_cubit.dart';
import '../../cubit/create_monthly_plan_state.dart';

class CreateMonthlyPlanNewBodyWidget extends StatelessWidget {
  const CreateMonthlyPlanNewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime firstDayOfNextMonth = DateTime.utc(now.year, now.month + 1, 1);
    DateTime lastDayOfNextMonth = DateTime.utc(now.year, now.month + 2, 0);
    DateTime focusedDay =
        firstDayOfNextMonth; 

    return SafeArea(
      child: BlocBuilder<CreateMonthlyPlanCubit, CreateMonthlyPlanState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
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
                    firstDay: firstDayOfNextMonth,
                    lastDay: lastDayOfNextMonth,
                    focusedDay: focusedDay,
                    enabledDayPredicate: (day) => day.weekday != DateTime.sunday,
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        // Check if the date exists in state.dailyPlanList
                        var dateExists = state.dailyPlanList
                            .any((plan) => isSameDay(plan.createdDate, day));
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: dateExists
                                ? Colors.green
                                : null, // Change color if date exists
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
                    onDaySelected: (selectedDay, focusedDay)  async => await handleDaySelection(selectedDay, context),
                  ),
                  20.verticalSpace,
                context.watch<CreateMonthlyPlanCubit>().state.isLoading == true  ? CustomLoadingWidget() :   CommonButton(title: 'Submit Plans',callback: () async {
                  int totalDailyPlanCount  = context.read<CreateMonthlyPlanCubit>().state.dailyPlanList.length;
                  int toatlCount = context.read<CreateMonthlyPlanCubit>().countDaysWithoutSundays(DateTime.now().year, DateTime.now().month +1);
                  int reamaingDays = toatlCount - totalDailyPlanCount;
                  // if(totalDailyPlanCount < toatlCount) {
                  //   if(context.mounted) {
                  //     QuickAlert.show(context: context, type: QuickAlertType.warning,
                  //     showConfirmBtn: true,
                  //     animType: QuickAlertAnimType.slideInDown,
                  //     confirmBtnText: "okay",
                  //     textColor: Colors.black,
                      
                  //   text: "Please fill all the remaining $reamaingDays days") ;
                    
                  //   }
                  // }else {
                  //   if(context.mounted) {
                  //     List<DateTime> dates = context.read<CreateMonthlyPlanCubit>().getStartAndEndDate();
                  //     CreateMonthlyPlanPostModel createMonthlyPlanPostModel = CreateMonthlyPlanPostModel(
                  //       planStartDate: dates.first.toString().split(" ").first.toString(),
                  //       planEndDate: dates.last.toString().toString().split(" ").first.toString(),
                  //       dailyPlans: context.read<CreateMonthlyPlanCubit>().state.dailyPlanList.map((e) => DailyPlanPostModel(
                  //         createdDate: e.createdDate.toString().split(" ").first.toString(),
                  //         approxKms: double.tryParse(e.approxKms.toString()) ?? 0.0,
                  //         customerCodes: e.customerCodes.map((e) => int.parse(e.toString())).toList(),
                  //       )).toList(),
                  //     );

                  //     // POST METHOD
                  //     log(createMonthlyPlanPostModel.toJson().toString());

                  //     context.read<CreateMonthlyPlanCubit>().createMonthlyPlan(createMonthlyPlanPostModel: createMonthlyPlanPostModel);
                      
                  //   }
                  // }
                  


                    if(totalDailyPlanCount < 2) {
                      if(context.mounted) {
                        QuickAlert.show(context: context, type: QuickAlertType.warning,
                        showConfirmBtn: true,
                        barrierDismissible: false,
                        animType: QuickAlertAnimType.slideInDown,
                        confirmBtnText: "okay",
                        textColor: Colors.black,
                        
                      text: "Please fill atleast two day from the remaining $reamaingDays days") ;
                      
                      }
                    }else {
                      if(context.mounted) {
                      List<DateTime> dates = context.read<CreateMonthlyPlanCubit>().getStartAndEndDate();
                      CreateMonthlyPlanPostModel createMonthlyPlanPostModel = CreateMonthlyPlanPostModel(
                        planStartDate: dates.first.toString().split(" ").first.toString(),
                        planEndDate: dates.last.toString().toString().split(" ").first.toString(),
                        dailyPlans: context.read<CreateMonthlyPlanCubit>().state.dailyPlanList.map((e) => DailyPlanPostModel(
                          createdDate: e.createdDate.toString().split(" ").first.toString(),
                          approxKms: double.tryParse(e.approxKms.toString()) ?? 0.0,
                          farmIds: e.farmIds.map((e) => int.parse(e.toString())).toList(),
                        )).toList(),
                      );

                      // POST METHOD
                      log(createMonthlyPlanPostModel.toJson().toString());

                      context.read<CreateMonthlyPlanCubit>().createMonthlyPlan(createMonthlyPlanPostModel: createMonthlyPlanPostModel);
                      
                    }
                    }
                },),
            
             
             
              ],
            ),
          );
        },
      ),
    );
  }
    Future<void> handleDaySelection(DateTime selectedDay, BuildContext context) async {
       context
                  .read<CreateMonthlyPlanCubit>()
                  .onDateFieldChange(dateField: selectedDay.toString());

              if (context
                  .read<CreateMonthlyPlanCubit>()
                  .state
                  .dailyPlanList
                  .where(
                      (e) => e.createdDate.toString() == selectedDay.toString())
                  .isNotEmpty) {
                var dailyPlan = context
                    .read<CreateMonthlyPlanCubit>()
                    .state
                    .dailyPlanList
                    .where((e) =>
                        e.createdDate.toString() == selectedDay.toString())
                    .first;

                await showDialog(
                    context: context,
                    builder: (c) => AlertDialog(
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const CommonTextWidget(
                                    title: 'Plan Details',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const Spacer(),
                                  CircleAvatar(
                                    backgroundColor: AppColors.errorColor,
                                    child: IconButton(
                                        onPressed: () {
                                          context
                                              .read<CreateMonthlyPlanCubit>().removeDailyPlanList(dailyPlan: dailyPlan);
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        )),
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
                                                .format(dailyPlan.createdDate)}",
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
                                        title: " ${double.parse(dailyPlan.approxKms
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
                                      title: " ${dailyPlan.farmIds
                                              .map((e) => e)
                                              .join(",\n")}",
                                      align: TextAlign.start,
                                      fontWeight: FontWeight.bold,
                                      maxLines: 5,
                                    ),
                                  )
                                ],
                              ),
                              10.verticalSpace,
                  //             Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceAround,
                  //               children: [
                  //                 Expanded(
                  //                     child: CommonButton(
                  //                         callback: ()  async {
                  //                           // UPDATE MONTHLY PLAN FUNCTION
                  //                           if (context.mounted)  {
                  //                             Navigator.pop(context);
                  //                             context.read<CreateMonthlyPlanCubit>().resetSelectedCustomers();
                  //                             context.read<CreateMonthlyPlanCubit>().onKiloMeterChange(value: dailyPlan.approxKms.toString());
                  // await showDialog(
                  //     useSafeArea: true,
                  //     barrierDismissible: false,
                  //     context: context,
                  //     builder: (c) => AlertDialog(
                  //         shadowColor: Colors.grey,

                  //         // title: Text("Selected Date"),
                  //         content: SingleChildScrollView(
                  //             child: Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [
                  //             Row(
                  //               children: [
                  //                 CommonTextWidget(
                  //                   title: 'Update Plan',
                  //                   fontWeight: FontWeight.bold,
                  //                   align: TextAlign.center,
                  //                   textSize: 24.sp,
                  //                   textColor: AppColors.primaryColor,
                  //                 ),
                  //                 const Spacer(),
                  //                 CircleAvatar(
                  //                   backgroundColor: AppColors.primaryColor,
                  //                   child: IconButton(
                  //                       onPressed: () {
                  //                         context
                  //                             .read<CreateMonthlyPlanCubit>()
                  //                             .resetForm();
                  //                         Navigator.pop(context);
                  //                       },
                  //                       icon: const Icon(
                  //                         Icons.close,
                  //                         color: Colors.white,
                  //                       )),
                  //                 )
                  //               ],
                  //             ),
                  //             const Divider(
                  //               color: AppColors.primaryColor,
                  //             ),
                  //             20.verticalSpace,
                  //             // DateField
                  //             const MonthlyPlanDateTextFieldWidget(),
                  //             20.verticalSpace,
                  //             const MonthlyPlanKilometerTextField(),
                  //             20.verticalSpace,
                  //             const MonthlyPlanCustomerListDropDownWidget(),
                  //             20.verticalSpace,
                //               CommonButton(
                //                   callback: () async {
                //                     if (context
                //                             .read<CreateMonthlyPlanCubit>()
                //                             .kilometerTextEditingController
                //                             .text
                //                             .isEmpty &&
                //                         context
                //                             .read<CreateMonthlyPlanCubit>()
                //                             .state
                //                             .selectedCustomersList
                //                             .isEmpty) {
                //                       Fluttertoast.showToast(
                //                           msg:
                //                               'Please enter approx kilometer and select customers');
                //                       return;
                //                     }

                //                     if (context
                //                         .read<CreateMonthlyPlanCubit>()
                //                         .kilometerTextEditingController
                //                         .text
                //                         .isEmpty) {
                //                       Fluttertoast.showToast(
                //                           msg: 'Approx kilometer is mandatory');
                //                       return;
                //                     }

                //                     if (context
                //                         .read<CreateMonthlyPlanCubit>()
                //                         .state
                //                         .selectedCustomersList
                //                         .isEmpty) {
                //                       Fluttertoast.showToast(
                //                           msg: 'Please select customers');
                //                       return;
                //                     }
                //                     var date = context
                //                         .read<CreateMonthlyPlanCubit>()
                //                         .state
                //                         .dateField
                //                         .value
                //                         .fold((l) => DateTime.now(),
                //                             (r) => DateTime.parse(r));
                //                     DailyPlan dailyPlan = DailyPlan(
                //                         createdDate: date,
                //                         approxKms: double.parse(context
                //                             .read<CreateMonthlyPlanCubit>()
                //                             .kilometerTextEditingController
                //                             .text
                //                             .toString()),
                //                         customerCodes: context
                //                             .read<CreateMonthlyPlanCubit>()
                //                             .state
                //                             .selectedCustomersList
                //                             .map((e) => e.customerCode ?? "")
                //                             .toList());

                //                     // adding condition to check whether the CUSTOMER is already present in the list or not
                //                     bool isCustomersExits = context
                //                         .read<CreateMonthlyPlanCubit>()
                //                         .checkIfAnyCustomerAlreadyExists();
                //                     DailyPlan? dailyPlanModel = context
                //                         .read<CreateMonthlyPlanCubit>()
                //                         .findFirstMatchingDailyPlan();
                //                     if (isCustomersExits) {
                //                       if (context.mounted) {
                //                         await showDialog(
                //                             context: context,
                //                             builder: (alertContext) =>
                //                                 AlertDialog(
                //                                   // Use alertContext for this specific dialog
                //                                   title: const Text(
                //                                       'Customer Already Exists'),
                //                                   content: RichText(
                //                                     text: TextSpan(
                //                                       style: const TextStyle(
                //                                         // Default text style
                //                                         color: Colors.black,
                //                                         fontSize: 16.0,
                //                                       ),
                //                                       children: <TextSpan>[
                //                                         const TextSpan(
                //                                             text:
                //                                                 'Customer already exists in the plan for '),
                //                                         TextSpan(
                //                                           text: DateFormat(
                //                                                   'dd-MMMM-yyyy')
                //                                               .format(dailyPlanModel!
                //                                                   .createdDate),
                //                                           style:
                //                                               const TextStyle(
                //                                             fontWeight:
                //                                                 FontWeight.bold,
                //                                             color: Colors
                //                                                 .black, // Explicitly setting to black for emphasis
                //                                           ),
                //                                         ),
                //                                       ],
                //                                     ),
                //                                   ),
                //                                   actions: [
                //                                     TextButton(
                //                                         onPressed: () {
                //                                           Navigator.pop(
                //                                               alertContext); // Close only the alert dialog
                //                                         },
                //                                         child: const Text('Ok'))
                //                                   ],
                //                                 ));
                //                       }
                //                     } else {
                //                       context
                //                           .read<CreateMonthlyPlanCubit>()
                //                           .updateDailyPlanList(
                //                               dailyPlan: dailyPlan);
                //                       if (context.mounted) {
                //                         Navigator.pop(
                //                             context); // This still closes the main dialog
                //                       }
                //                     }
                //                   },
                //                   title: "Submit")
                //             ],
                //           ))));
                // }
                //                           }, title: "Update")),
                              //     10.horizontalSpace,
                              //     Expanded(
                              //         child:
                             
                              // ),
                              //   ],
                              // ),
                               CommonButton(
                                          callback: () {
                                            if (context.mounted) {
                                              Navigator.pop(context);
                                            }
                                          },
                                          title: "Close"),
                              20.verticalSpace,
                              
                              const Divider(
                                color: AppColors.primaryColor,
                                height: 4,
                                indent: 4,
                                thickness: 2,
                              ),
                            ],
                          ),
                        ));

              } else {
                if (context.mounted) {
                  await showDialog(
                      useSafeArea: true,
                      barrierDismissible: false,
                      context: context,
                      builder: (c) => AlertDialog(
                          shadowColor: Colors.grey,
                          backgroundColor: Colors.white,

                          // title: Text("Selected Date"),
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
                                          context
                                              .read<CreateMonthlyPlanCubit>()
                                              .resetForm();
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
                              const MonthlyPlanDateTextFieldWidget(),
                              20.verticalSpace,
                              const MonthlyPlanKilometerTextField(),
                              20.verticalSpace,
                              const MonthlyPlanCustomerListDropDownWidget(),
                              20.verticalSpace,
                              CommonButton(
                                  callback: () async {
                                    if (context
                                            .read<CreateMonthlyPlanCubit>()
                                            .kilometerTextEditingController
                                            .text
                                            .isEmpty &&
                                        context
                                            .read<CreateMonthlyPlanCubit>()
                                            .state
                                            .selectedCustomersList
                                            .isEmpty) {
                                      Fluttertoast.showToast(
                                          msg:
                                              'Please enter approx kilometer and select customers');
                                      return;
                                    }

                                    if (context
                                        .read<CreateMonthlyPlanCubit>()
                                        .kilometerTextEditingController
                                        .text
                                        .isEmpty) {
                                      Fluttertoast.showToast(
                                          msg: 'Approx kilometer is mandatory');
                                      return;
                                    }

                                    if (context
                                        .read<CreateMonthlyPlanCubit>()
                                        .state
                                        .selectedCustomersList
                                        .isEmpty) {
                                      Fluttertoast.showToast(
                                          msg: 'Please select customers');
                                      return;
                                    }
                                    var date = context
                                        .read<CreateMonthlyPlanCubit>()
                                        .state
                                        .dateField
                                        .value
                                        .fold((l) => DateTime.now(),
                                            (r) => DateTime.parse(r));
                                    DailyPlan dailyPlan = DailyPlan(
                                        createdDate: date,
                                        approxKms: double.parse(context
                                            .read<CreateMonthlyPlanCubit>()
                                            .kilometerTextEditingController
                                            .text
                                            .toString()),
                                        farmIds: context
                                            .read<CreateMonthlyPlanCubit>()
                                            .state
                                            .selectedCustomersList
                                            .map((e) => e.farm!.farmId.toString())
                                            .toList());

                                    // adding condition to check whether the CUSTOMER is already present in the list or not
                                    bool isCustomersExits = context
                                        .read<CreateMonthlyPlanCubit>()
                                        .checkIfAnyCustomerAlreadyExists();
                                    DailyPlan? dailyPlanModel = context
                                        .read<CreateMonthlyPlanCubit>()
                                        .findFirstMatchingDailyPlan();
                                  List<DailyPlan> dailyPlanLists = context.read<CreateMonthlyPlanCubit>().findListOfExistingDailyPlan();

                                    if (isCustomersExits) {
                                      if (context.mounted) {
                                        await showDialog(
                                            context: context,
                                            builder: (alertContext) =>
                                                AlertDialog(
                                                  // Use alertContext for this specific dialog
                                                  title: const Text(
                                                      'Customer Already Exists'),
                                                  content: RichText(
                                                    text: TextSpan(
                                                      style: const TextStyle(
                                                        // Default text style
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                      ),
                                                      children: <TextSpan>[
                                                         TextSpan(
                                                            text:
                                                                'Customer already exists in the plan for '),
                                                        TextSpan(
                                                          text: 
                                                          dailyPlanLists.map( (e) => "( "+ DateFormat(
                                                                  'dd-MMMM-yyyy')
                                                              .format(e.createdDate) + ")"
                                                          ).join(", "),
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppColors.primaryColor, // Explicitly setting to black for emphasis
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              alertContext); // Close only the alert dialog
                                                        },
                                                        child: const Text('Cancel')),

                                                             TextButton(
                                                        onPressed: () {
                                                 context
                                          .read<CreateMonthlyPlanCubit>()
                                          .addDailyPlanList(
                                              dailyPlan: dailyPlan);
                                      if (context.mounted) {
                                        Navigator.pop(
                                            context); // This still closes the main dialog
                                      }

                                      if(context.mounted) {
                                        Navigator.pop(alertContext);
                                      }
                                                        },
                                                        child: const Text('Overwrite')),
                                                        

                                                  ],
                                                ));
                                      }
                                    } else {
                                    context
                                          .read<CreateMonthlyPlanCubit>()
                                          .addDailyPlanList(
                                              dailyPlan: dailyPlan);
                                      if (context.mounted) {
                                        Navigator.pop(
                                            context); // This still closes the main dialog
                                      }
                                    }
                                  },
                                  title: "Submit")
                            ],
                          ))));
                }
              }

    }


  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
