import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/cubit/alert_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Alerts%20/presentations/screens/widget/alert_body_widget.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback( (timeStamp) {
      context.read<AlertCubit>().getAlerts();
    });
  }


  @override
  Widget build(BuildContext context) {
    

    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts'),
      ),
      body: const SafeArea(
        child:  AlertBodyWidget(),
      ),
    );
  }
}