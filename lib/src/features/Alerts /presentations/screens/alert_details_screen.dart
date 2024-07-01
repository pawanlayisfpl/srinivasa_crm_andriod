import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/domain/model/get/alert_response_model.dart';


class AlertDetailsScreen extends StatelessWidget {
  final AlertModel alertModel;

  const AlertDetailsScreen({
    Key? key,
    required this.alertModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification ID: ${alertModel.notificationId ?? "N/A"}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            // SizedBox(height: 8.0),
            // Text(
            //   'Monthly Plan ID: ${alertModel.monthlyPlanId ?? "N/A"}',
            //   style: Theme.of(context).textTheme.bodyLarge,
            // ),
            const SizedBox(height: 8.0),
             Text(
              'Created Date: ${alertModel.createdDate == null ? "No date" : DateFormat('dd/MM/yyyy').format(DateTime.parse(alertModel.createdDate.toString()))}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Message: ${alertModel.message ?? "No message"}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8.0),
           
            // Text(
            //   'Read: ${alertModel.read == null ? "Unknown" : (alertModel.read! ? "Yes" : "No")}',
            //   style: Theme.of(context).textTheme.bodyLarge,
            // ),
          ],
        ),
      ),
    );
  }
}
