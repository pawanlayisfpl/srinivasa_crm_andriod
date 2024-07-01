// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:srinivasa_crm_new/src/core/model/model.dart';

class AlertErrorWidget extends StatelessWidget {
  final ApiFailedModel apiFailedModel;
  const AlertErrorWidget({
    super.key,
    required this.apiFailedModel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(apiFailedModel.message),
          ElevatedButton(
            onPressed: () {
              // context.read<AlertCubit>().getAlerts();
            },
            child: const Text('Retry'),
          )
        ],
      ),
    );
  }
}
