import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/update_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/screen/widget/update_monthly_plan_body_widget.dart';

class UpdateMonthlyPlanScreen extends StatefulWidget {
  final int? id;
  const UpdateMonthlyPlanScreen({super.key, this.id});

  @override
  State<UpdateMonthlyPlanScreen> createState() => _UpdateMonthlyPlanScreenState();
}

class _UpdateMonthlyPlanScreenState extends State<UpdateMonthlyPlanScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) {
      // context.read<UpdateMonthlyPlanCubit>().getAllViewMonthlyPlan(id: widget.id ?? -1);
      context.read<UpdateMonthlyPlanCubit>().getAllInitialValues(id:widget.id ?? -1);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Monthly Plan'),
      ),
      body: const SafeArea(child: UpdateMonthlyPlanBodyWidget()),
    );
  }
}