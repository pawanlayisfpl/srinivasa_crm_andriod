// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/view_monthly_plan_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/screens/widget/monthly_plan_card_widget.dart';

class ViewMonthlyPlanFullDetailsScreen extends StatelessWidget {
  final ViewDailyPlanModel? viewDailyPlanModel;
  const ViewMonthlyPlanFullDetailsScreen({
    Key? key,
    this.viewDailyPlanModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Customers List"),),
      body: SafeArea(child: viewDailyPlanModel!.customers!.isEmpty ? EmptyWidget(title: "No Customers Found ", callback: () {}) : AnimationLimiter(child: ListView.separated(
          padding: EdgeInsets.only(top: 10.h),
        itemBuilder: (c,i) {
        return AnimationConfiguration.staggeredList(position: i, child: SlideAnimation(
          verticalOffset: 50,
          duration: const Duration(milliseconds: 500),
          child: FadeInAnimation(
            curve: Curves.easeIn,
            
            duration: const Duration(milliseconds: 300),
            // name,code, city,address phone,status
            child: ViewMOnthlyPlanFullDetailsCardWidget(customerModel: viewDailyPlanModel!.customers![i].customer )
            ,)
            ,));
      },itemCount: viewDailyPlanModel!.customers!.length, separatorBuilder: (BuildContext context, int index) { 
        return           Divider(thickness: 2,color: AppColors.secondaryTextClr,).withSymetricPadding(horizontalPadding: 20.w);

       },)),),
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
    return Card(
      color: Colors.white,
      elevation: 8,
      
      
      child: Column(
        children: [
         MonthlyPlanRowWidget(title: "Name", value: customerModel!.customerName ?? "No Name found"),
        //  5.verticalSpace,
        //   MonthlyPlanRowWidget(title: "Code", value: customerModel!.customerCode ?? "No Customer code found"),
          5.verticalSpace,
          MonthlyPlanRowWidget(title: "City", value: customerModel!.customerCity ?? "No City found"),
          5.verticalSpace,
          MonthlyPlanRowWidget(title: "Address", value: customerModel!.customerAddress ?? "No Address found"),
          5.verticalSpace,
          MonthlyPlanRowWidget(title: "Phone", value: customerModel!.customerContactNumber ?? "No Phone found"),
          5.verticalSpace,
       customerModel!.customerAlternateContactNumber == null ? SizedBox.shrink()  :  MonthlyPlanRowWidget(title: "Alternative Phone", value: customerModel!.customerAlternateContactNumber ?? "No Status found"),
          5.verticalSpace,
          MonthlyPlanRowWidget(title: "Status", value: customerModel!.status ?? "No Status found"),
        ],
      ).withSymetricPadding(horizontalPadding: 10.w,verticalPadding: 10.h),
    ).withSymetricPadding(horizontalPadding: 10.w,verticalPadding: 5.h);
  }
}
