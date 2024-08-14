// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/ViewMonthly%20Plan/cubit/view_monthly_plan_cubit.dart';

import 'widget/view_monthly_plan_body_widget.dart';

class ViewMonthlyPlanScreen extends StatefulWidget {
  final String? selectedDate;
  final int? monthlyPlanId;

  const ViewMonthlyPlanScreen({
    super.key,
    this.selectedDate,
    this.monthlyPlanId,
  });

  @override
  State<ViewMonthlyPlanScreen> createState() => _ViewMonthlyPlanScreenState();
}

class _ViewMonthlyPlanScreenState extends State<ViewMonthlyPlanScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((c)  async{
      widget.selectedDate != null
          ? context.read<ViewMonthlyPlanCubit>().getAllMonthlyPlanData(selectedDate: widget.selectedDate ?? "")
          : null;

     if(widget.monthlyPlanId != null) {
      context.read<ViewMonthlyPlanCubit>().getAllMonthlyPlanByMonthlyPlanID(id: int.parse(widget.monthlyPlanId.toString()));
     }     
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Monthly Plan'),
      ),
      body: const SafeArea(child: ViewMonthlyPlanBodyWidget()));
  }
}