// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/animations/routes/all_animate_routes.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/data/repo/sales_repo.dart';

import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/view_sales_order_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Particular/screens/paticular_sales_order_screen.dart';

import '../../../../../config/config.dart';

class SalesOrderViewCardWidget extends StatelessWidget {
  final Orders orders;
  const SalesOrderViewCardWidget({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       if(context.mounted) {
        Navigator.push(context, ScaleRoute(screen: ParticularSalesOrderScreen(orderId: orders.orderId ?? 0,)));
       }

      },
      child: Card(
        color: Colors.white,
        elevation: 7,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  
                  flex : 3,
                  child: CommonTextWidget(title: "Customer :")),
                Expanded(
                  flex : 7,
                  child: CommonTextWidget(title: orders.customerDetails != null ? orders.customerDetails!.custName ?? "" : "",fontWeight: FontWeight.w600,)),
              ],
            ),
            5.verticalSpace,
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  
                  flex : 3,
                  child: CommonTextWidget(title: "Order Id :")),
                Expanded(
                  flex : 7,
                  child: CommonTextWidget(title: orders.orderId.toString(),fontWeight: FontWeight.w600,)),
              ],
            ),
            5.verticalSpace,
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  
                  flex : 3,
                  child: CommonTextWidget(title: "Order Date :")),
                Expanded(
                  flex : 7,
                  child: CommonTextWidget(title: DateFormat().add_yMMMd().format(DateTime.parse(orders.orderDate.toString())),fontWeight: FontWeight.w600,)),
              ],
            ),
            5.verticalSpace,
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  
                  flex : 3,
                  child: CommonTextWidget(title: "Order Status :")),
                Expanded(
                  flex : 7,
                  child: CommonTextWidget(title: orders.orderStatus!.replaceAll("_", " "),fontWeight: FontWeight.w600,)),
              ],
            ),
          ],
        ).withSymetricPadding(horizontalPadding: 10.w,verticalPadding: 10.h),
      ),
    );
  }
}
