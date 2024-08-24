import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/view_sales_order_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/cubit/sales_order_view_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/cubit/state/sales_order_view_state.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/widget/sales_order_view_card_widget.dart';

class SalesOrderApproveListWidget extends StatelessWidget {
  const SalesOrderApproveListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderViewCubit, SalesOrderViewState>(
      builder: (context, state) {
        return context.watch<SalesOrderViewCubit>().toApproveList.isEmpty ? EmptyWidget(title: "No orders to approve", callback: () {}) : ListView.separated(itemBuilder: (c,i) {
          Orders orders = context.watch<SalesOrderViewCubit>().toApproveList[i];
          return SalesOrderViewCardWidget(orders: orders);
        },itemCount: context.watch<SalesOrderViewCubit>().toApproveList.length, separatorBuilder: (BuildContext context, int index) { 
          return const Divider().withSymetricPadding(horizontalPadding: 20.w);
         },);
      },
    );
  }
}
