// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';

import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/get/alert_response_model.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_state.dart';

import 'alert_card_widget.dart';

class AlertsListWidget extends StatelessWidget {
  const AlertsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertCubit, AlertState>(
      builder: (context, state) {
        return AnimationLimiter(child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          itemCount: state.alertsList.length,
          itemBuilder: (context, index) {
            AlertModel alertModel = state.alertsList[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: AlertCardWidget(alertModel: alertModel,),
                ),
              ));
      },));
              },
    );
  }
}
