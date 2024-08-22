// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/domain/model/view_monthly_plan_model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/screens/view_monthly_plan_full_details_screen.dart';

class MonthlyPlanCardWidget extends StatelessWidget {
  final ViewMonthlyPlanModel monthlyPlanModel;
  final ViewDailyPlanModel model;
  const MonthlyPlanCardWidget({
    Key? key,
    required this.monthlyPlanModel,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            SlideLeftRoute(
                screen: ViewMonthlyPlanFullDetailsScreen(
                  monthlyPlanId: monthlyPlanModel.monthlyPlanId!,
              viewDailyPlanModel: model,
            )));
      },
      child: Container(
        height: 0.15.sh,
        width: 0.9.sw,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [  MonthlyPlanRowWidget(
                        title: "Approval Status",
                        value: monthlyPlanModel.approvalStatus != null ? monthlyPlanModel.approvalStatus.toString().trim() : "UNKOWN",
                        isStatusField: true,
                      ),
                      5.verticalSpace,
                      MonthlyPlanRowWidget(
                          title: "Approx Kilometer",
                          value: model.approxKms.toString() + " KM"),
                      5.verticalSpace,
                       MonthlyPlanRowWidget(
                          title: "Actual Kilometer",
                          value: model.actualKms.toString() + " KM"),
                      5.verticalSpace,
                    
                      MonthlyPlanRowWidget(
                          title: "Customers",
                          
                          value: model.customers!
                              .map((e) => e.customer!.customerName.toString())
                              .join(', ')),
                      5.verticalSpace,
                    ],
                  ).withPadding(left: 10, top: 10),
                ),
                // date widget
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:  AppColors.primaryColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonTextWidget(
                            title: DateFormat.d().format(
                                DateTime.parse(model.planDate.toString())).toString(),
                            textSize: 40.sp,
                            textColor: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          // 5.verticalSpace,
                          CommonTextWidget(
                            maxLines: 1,
                              title: DateFormat.MMMM().format(
                                  DateTime.parse(model.planDate.toString())).toString().substring(0,3),
                              textSize: 32.sp,
                              textColor: Colors.white)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MonthlyPlanRowWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool? isStatusField;
  const MonthlyPlanRowWidget({
    Key? key,
    required this.title,
    required this.value,
    this.isStatusField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonTextWidget(
            title: title + " : ",
            textSize: 14.sp,
            textColor: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w600,
          ),
          Expanded(
              flex: 5,
              child: CommonTextWidget(
                title: value,
                textSize: 14.sp,
                align: TextAlign.start,
                textColor: isStatusField != null
                    ? value.toString() != "PENDING"
                        ? AppColors.primaryColor
                        : AppColors.errorColor
                    : AppColors.blackColor,
                fontWeight: FontWeight.w500,
                maxLines: 3,
              ))
        ],
      ),
    );
  }
}
