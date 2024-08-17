import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/domain/model/get/pending_order_model.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Order%20Pending/cubit/pending_order_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Order%20Pending/cubit/state/pending_order_state.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Order%20Pending/screens/widgets/pending_order_card_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Particular/cubit/sales_order_particular_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/cubit/state/sales_order_view_state.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20View/widget/sales_order_view_card_widget.dart';

class PendingOrderLoadedWidget extends StatelessWidget {
  final PendingOrdersModel pendingOrderModel;
  const PendingOrderLoadedWidget({super.key, required this.pendingOrderModel});

  @override
  Widget build(BuildContext context) {
    return pendingOrderModel.orders == null || pendingOrderModel.orders!.isEmpty
        ? EmptyWidget(
            title: 'No Pending Order Request Found.',
            callback: () {
              context.read<PendingOrderCubit>().getAllPendingOrders();
            })
        : BlocBuilder<PendingOrderCubit, PendingOrderState>(
            builder: (context, state) {
              return AnimationLimiter(
                  child: ListView.builder(
                    controller: context.watch<PendingOrderCubit>().scrollController,
                itemBuilder: (c, i) => AnimationConfiguration.staggeredList(
                    position: i,
                    child: SlideAnimation(
                        horizontalOffset: 50,
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 600),
                        child: FadeInAnimation(
                            curve: Curves.ease,
                            // delay: const Duration(milliseconds: 250),
                            duration: const Duration(milliseconds: 600),
                            child: state.maybeMap(orElse: () => const  SizedBox.shrink(),loaded: (data) => PendingOrderCardWidget(orders: data.pendingOrderModel.orders![i]) )))),
                itemCount: state.maybeMap(orElse: () => 0, loaded: (r) => r.pendingOrderModel.orders!.length),
              ));
            },
          );
  }
}
