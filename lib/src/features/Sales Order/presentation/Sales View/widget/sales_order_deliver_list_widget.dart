import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/view_sales_order_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/cubit/sales_order_view_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/cubit/state/sales_order_view_state.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/widget/sales_order_view_card_widget.dart';

class SalesOrderDeliverListWidget extends StatelessWidget {
  const SalesOrderDeliverListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderViewCubit, SalesOrderViewState>(
      builder: (context, state) {
        return context.watch<SalesOrderViewCubit>().toDeliverList.isEmpty ? EmptyWidget(title: "No orders to Deliver", callback: () {}) : ListView.separated(itemBuilder: (c,i) {
          Orders orders = context.watch<SalesOrderViewCubit>().toDeliverList[i];
          return SalesOrderViewCardWidget(orders: orders);
        },itemCount: context.watch<SalesOrderViewCubit>().toDeliverList.length, separatorBuilder: (BuildContext context, int index) { 
          return const Divider().withSymetricPadding(horizontalPadding: 20.w);
         },);
      },
    );
  }
}
