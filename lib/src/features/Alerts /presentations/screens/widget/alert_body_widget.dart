import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_state.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/screens/widget/alert_loaded_widget.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/screens/widget/alert_loading_widget.dart';

class AlertBodyWidget extends StatelessWidget {
  const AlertBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlertCubit, AlertState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return
        state.isLoading == true ? const AlertLoadingWidget() : AlertLoadedWidget(alertsList: state.alertsList);
        // state.when(initial: () => const AlertLoadingWidget(), loading: () => const AlertLoadingWidget(), loaded: (data) => AlertLoadedWidget(alertsList: data,), error: (error ) => AlertErrorWidget(apiFailedModel: error));
      },
    );
  }
}
