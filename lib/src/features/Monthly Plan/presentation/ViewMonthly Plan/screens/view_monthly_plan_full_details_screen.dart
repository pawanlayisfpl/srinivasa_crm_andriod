// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quickalert/quickalert.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/config/locator/locator.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/customer_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/model/get/last_checkin_out_respone_model.dart';
import 'package:srinivasa_crm_new/src/features/Customer/domain/repo/customer_repo.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/screens/check_out_screen.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Checkin/screens/checkin_screen.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/view_monthly_plan_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/cubit/daily_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/cubit/state/daily_plan_state.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/screens/widgets/dp_customer_dropdown_widget.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/screens/widgets/dp_date_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/screens/widgets/dp_kilometer_textfield.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/screens/widget/monthly_plan_card_widget.dart';

import '../../Daily Plan/model/post/delete_dailyplan_postmodel.dart';

class ViewMonthlyPlanFullDetailsScreen extends StatelessWidget {
  final ViewDailyPlanModel? viewDailyPlanModel;
  final int monthlyPlanId;
  final String approvalStatus;
  const ViewMonthlyPlanFullDetailsScreen({
    super.key,
    this.viewDailyPlanModel,
    required this.monthlyPlanId,
    required this.approvalStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customers List"),
        actions:  approvalStatus.toLowerCase().toString() == 'approved' ?   [
          // UPDATE
          BlocBuilder<DailyPlanCubit, DailyPlanState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () async {

                  final results = await locator.get<InternetChecker>().hasInternet();
                // TODO: for emulator testing added (!)
                  if(results) {
                     context.read<DailyPlanCubit>().resetState();
                  context.read<DailyPlanCubit>().clearSelectedCustomerLists();
                  context
                      .read<DailyPlanCubit>()
                      .setDate(viewDailyPlanModel!.planDate.toString());
                  context
                      .read<DailyPlanCubit>()
                      .setKilometer(viewDailyPlanModel!.actualKms.toString());
                         List<Customermodel> customers = [];
                  for (int i = 0;
                      i < viewDailyPlanModel!.customers!.length;
                      i++) {
                    Customermodel customermodel = Customermodel(
                        customerName: viewDailyPlanModel!
                            .customers![i].customer!.customerName
                            .toString(),
                        farm: Farm(
                            farmId: int.tryParse(viewDailyPlanModel!
                                    .customers![i].customer!.farmId!) ??
                                0,
                            farmName: viewDailyPlanModel!
                                .customers![i].customer!.customerName
                                .toString()));
                    customers.add(customermodel);
                  }
                  context.read<DailyPlanCubit>().addToExistingCustomers(custLists: customers);
                   context.read<DailyPlanCubit>().setSelectedCustomerLists(selectedCustomers: customers);
                  AlertDialog alertDialog = AlertDialog(
                    backgroundColor: Colors.white,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            CommonTextWidget(
                              title: 'Update Plan',
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
                        const IgnorePointer(
                          ignoring: true,
                          child: DaiilyPlanDateTextField()),
                        20.verticalSpace,
                        const DailyPlanKilometerTextField(),
                        20.verticalSpace,
                        const DailyPlanCustomerListDropdownWidget(),
                        20.verticalSpace,
                        CommonButton(
                            callback: () async {
                              // SET DATE
                              // SET KILOMETER
                              // SET CUSTOMER
                          context.read<DailyPlanCubit>().updateDailyPlan(monthlyPlanid: monthlyPlanId, dailyPlanId: viewDailyPlanModel!.dailyPlanId!, context: context, errorCallback: () async {
                            Navigator.pop(context);
                            });
                            },
                            title: 'Submit')
                      ],
                    ),
                  );
                  if (context.mounted) {
                    showDialog(
                        useSafeArea: true,
                        barrierDismissible: false,
                        context: context,
                        builder: (c) => alertDialog);
                  }

                  }else {
                    if(context.mounted) {
                      QuickAlert.show(context: context, type: QuickAlertType.warning,animType: QuickAlertAnimType.slideInDown,
                      title: 'No Internet',
                      text: 'Internet is requried to use this feature',
                      confirmBtnColor: Colors.black
                      );
                    }
                  }

               

                 
                },
                icon: const Icon(Icons.edit),
              );
            },
          ),
          10.horizontalSpace,
          BlocBuilder<DailyPlanCubit, DailyPlanState>(
            builder: (context, state) {
              return IconButton(
                tooltip: "Delete",
                icon: const Icon(Icons.delete),
                onPressed: () async {
                                    final results = await locator.get<InternetChecker>().hasInternet();


// TODO: for testing (! ) added this
                    if(results) {
                      // INTERNET AVAILABLE
                        DailyplanDeletePostModel dailyplanDeletePostModel = DailyplanDeletePostModel(monthlyPlanId: monthlyPlanId.toString(), dailyPlanId: viewDailyPlanModel!.dailyPlanId.toString());

                    if(context.mounted) {

                       QuickAlert.show(context: context, type: QuickAlertType.confirm,
                      title: "Delete Plan",
                      text: "Are you sure you want to delete this plan?",
                      confirmBtnText: "Yes",
                      cancelBtnText: "No",
                      onConfirmBtnTap: () {
                        Navigator.pop(context);
                        context
                            .read<DailyPlanCubit>()
                            .deleteDailyPlan(ctx: context, dailyPlanDeletePostModel: dailyplanDeletePostModel, callback: () {
                              Navigator.pop(context);
                              context.read<ViewMonthlyPlanCubit>().getAllMonthlyPlanByMonthlyPlanID(id: monthlyPlanId);
                            });

                        // context
                        //     .read<DailyPlanCubit>()
                        //     .deletePlan(monthlyPlanId: monthlyPlanId);
                },
                  );
                    }
                    }else {
                      // NO INTERNET
                       if(context.mounted) {
                      QuickAlert.show(context: context, type: QuickAlertType.warning,animType: QuickAlertAnimType.slideInDown,
                      title: 'No Internet',
                      text: 'Internet is requried to use this feature',
                      confirmBtnColor: Colors.black
                      );
                    } 


                    }
                    }
              );
            },
          ),
        ] : [],
      ),
      body: SafeArea(
        child: viewDailyPlanModel!.customers!.isEmpty
            ? EmptyWidget(title: "No Customers Found ", callback: () {})
            : AnimationLimiter(
                child: ListView.separated(
                padding: EdgeInsets.only(top: 10.h),
                itemBuilder: (c, i) {
                  return AnimationConfiguration.staggeredList(
                      position: i,
                      child: SlideAnimation(
                        verticalOffset: 50,
                        duration: const Duration(milliseconds: 500),
                        child: FadeInAnimation(
                          curve: Curves.easeIn,

                          duration: const Duration(milliseconds: 300),
                          // name,code, city,address phone,status
                          child: ViewMOnthlyPlanFullDetailsCardWidget(
                              customerModel:
                                  viewDailyPlanModel!.customers![i].customer),
                        ),
                      ));
                },
                itemCount: viewDailyPlanModel!.customers!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 2,
                    color: AppColors.secondaryTextClr,
                  ).withSymetricPadding(horizontalPadding: 20.w);
                },
              )),
      ),
    );
  }
}

class ViewMOnthlyPlanFullDetailsCardWidget extends StatelessWidget {
  final Customer? customerModel;
  const ViewMOnthlyPlanFullDetailsCardWidget({
    super.key,
    required this.customerModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Fluttertoast.showToast(msg: 'Working');
  //       String? inTime;
  // int? customerid;
  // String? customerName;
  // String? langitude;
  // String? latitude;
  // String? remarks;
  // String? farmId;

 



        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (c) => 
        //         CheckinScreen(customermodel: 
        //         Customermodel(customerName:  customerModel!.customerName,farm: Farm(farmId: int.parse(customerModel!.farmId!),customerId: customerModel!.customerId)))
        //             )
        //             );
      
      },
      child: Card(
        color: Colors.white,
        elevation: 8,
        child: Column(
          children: [
            MonthlyPlanRowWidget(
                title: "Name",
                value: customerModel!.customerName ?? "No Name found"),
            //  5.verticalSpace,
            //   MonthlyPlanRowWidget(title: "Code", value: customerModel!.customerCode ?? "No Customer code found"),
            5.verticalSpace,
            MonthlyPlanRowWidget(
                title: "City",
                value: customerModel!.customerCity ?? "No City found"),
            5.verticalSpace,
            MonthlyPlanRowWidget(
                title: "Address",
                value: customerModel!.customerAddress ?? "No Address found"),
            5.verticalSpace,
            MonthlyPlanRowWidget(
                title: "Phone",
                value: customerModel!.customerContactNumber ?? "No Phone found"),
            5.verticalSpace,
            customerModel!.customerAlternateContactNumber == null
                ? const SizedBox.shrink()
                : MonthlyPlanRowWidget(
                    title: "Alternative Phone",
                    value: customerModel!.customerAlternateContactNumber ??
                        "No Status found"),
            5.verticalSpace,
            MonthlyPlanRowWidget(
                title: "Status",
                value: customerModel!.status ?? "No Status found"),
                20.verticalSpace,
                CommonButton(callback: ()async {
                   final results = await locator.get<CustomerRepo>().getLastCheckInCheckoutDetails(customerId: customerModel!.customerId!, farmId: customerModel!.farmId!);
    results.fold((l)  {
      log('left ${l.toString()}');
    }, (r) {
      // log(r.toString());
      LastCheckinOutResponseModel lastCheckinOutResponseModel = r;
      log(lastCheckinOutResponseModel.toJson().toString());

      if(lastCheckinOutResponseModel.status == true) {
        // nav to checkin screen
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => 
                CheckinScreen(customermodel: 
                Customermodel(customerName:  customerModel!.customerName,farm: Farm(farmId: int.parse(customerModel!.farmId!),customerId: customerModel!.customerId)))
                    )
                    );

      }else {
        // nav to checkout screen
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => 
                CheckoutScreen(customermodel: 
                Customermodel(customerName:  customerModel!.customerName,farm: Farm(farmId: int.parse(customerModel!.farmId!),customerId: customerModel!.customerId)))
                    )
                    );
      }
    });
                }, title: "Proceed to Checkin/Checkout")
          ],
        ).withSymetricPadding(horizontalPadding: 10.w, verticalPadding: 10.h),
      ).withSymetricPadding(horizontalPadding: 10.w, verticalPadding: 5.h),
    );
  }
}
