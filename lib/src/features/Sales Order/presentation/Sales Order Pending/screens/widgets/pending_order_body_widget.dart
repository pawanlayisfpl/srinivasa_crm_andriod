import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Order%20Pending/cubit/state/pending_order_state.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Order%20Pending/screens/widgets/pending_order_error_widget.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Order%20Pending/screens/widgets/pending_order_loaded_widget.dart';

import '../../cubit/pending_order_cubit.dart';
import 'pending_order_loading_widget.dart';

class PendingOrderBodyWidget extends StatelessWidget {
  const PendingOrderBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PendingOrderCubit, PendingOrderState>(
      builder: (context, state) {
        return state.when(initial: () => const PendingOrderPendingWidget(), loading: () => const PendingOrderPendingWidget(), loaded: (data) => PendingOrderLoadedWidget(pendingOrderModel: data,), error: (apiFailedModel) => PendingOrderErrorWidget(message: apiFailedModel.errorMessage.toString(),));
      },
    );
  }
}
