// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/get/alert_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/screens/widget/alerts_list_widget.dart';

class AlertLoadedWidget extends StatelessWidget {
  final List<AlertModel> alertsList;
  const AlertLoadedWidget({
    super.key,
    required this.alertsList,
  });

  @override
  Widget build(BuildContext context) {
    return alertsList.isEmpty ? EmptyWidget(title: "No alerts found", callback: () async {
    await  context.read<AlertCubit>().getAlerts();
    }).withSymetricPadding(horizontalPadding: 20.w) : const AlertsListWidget();
  }
}
