// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Order%20Pending/cubit/pending_order_cubit.dart';

class PendingOrderErrorWidget extends StatelessWidget {
  final String message;
  const PendingOrderErrorWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return CommonErrorWidget(error: message, callback: () {
      context.read<PendingOrderCubit>().getAllPendingOrders();
    });
  }
}
