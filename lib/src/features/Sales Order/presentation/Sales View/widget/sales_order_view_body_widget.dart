import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Search/presentation/screens/widgets/search_customer_loading_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/cubit/state/sales_order_view_state.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/widget/SalesOrderViewListWidget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/widget/sales_order_approve_list_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/widget/sales_order_deliver_list_widget.dart';

import '../cubit/sales_order_view_cubit.dart';

class SalesOrderViewBodyWidget extends StatelessWidget {
  const SalesOrderViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderViewCubit, SalesOrderViewState>(
      builder: (context, state) {
        return state.isLoading ? const SearchCustomerLoadingWidget() : state.viewSalesOrderModel.orders != null && state.viewSalesOrderModel.orders!.isEmpty ? EmptyWidget(title: "No orders found", callback: () async {
          context.read<SalesOrderViewCubit>().getSalesOrder();
        }) :  const TabBarView(
           
          children: [
          SalesOrderViewListWidget(),
          SalesOrderDeliverListWidget(),
          SalesOrderApproveListWidget(),
        ]);
        
        
        
      },
    );
  }
}
