import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/cubit/monthly_plan_pending_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Monthly%20Plan%20PendingRequests/screens/widget/monthly_plan_pending_body_widget.dart';

class MonthlyPlanPendingRequestScreen extends StatefulWidget {
  const MonthlyPlanPendingRequestScreen({super.key});

  @override
  State<MonthlyPlanPendingRequestScreen> createState() => _MonthlyPlanPendingRequestScreenState();
}

class _MonthlyPlanPendingRequestScreenState extends State<MonthlyPlanPendingRequestScreen> {
 
    @override
    void initState() {
      WidgetsBinding.instance.addPostFrameCallback((time) async {
        await context.read<MonthlyPlanPendingCubit>().getPendingRequests();
      });
      super.initState();
      
    }
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Requests'),
      ),
      body: const SafeArea(child: MonthlyPlanPendingBodyWidget(),),
    );
  }
}