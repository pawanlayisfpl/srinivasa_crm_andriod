// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/widgets/error/error.dart';

import 'package:srinivasa_crm_new/src/core/model/model.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/cubit/monthly_plan_pending_cubit.dart';

class MonthlyPlanPendingErrorWidget extends StatelessWidget {
  final ApiFailedModel apiFailedModel;
  const MonthlyPlanPendingErrorWidget({
    super.key,
    required this.apiFailedModel,
  });

  @override
  Widget build(BuildContext context) {
    return CommonErrorWidget(error: apiFailedModel.errorMessage.toString(), callback: () {
      context.read<MonthlyPlanPendingCubit>().getPendingRequests();
    });
  }
}
