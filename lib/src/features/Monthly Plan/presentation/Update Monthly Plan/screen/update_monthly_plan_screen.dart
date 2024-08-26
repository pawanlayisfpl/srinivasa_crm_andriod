import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
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
        actions: [
          // IconButton(onPressed: () {
          //   if(context.mounted) {
          //     QuickAlert.show(context: context, 
          //     titleColor: Colors.black,
          //     confirmBtnColor: Colors.black,
          //     showConfirmBtn: true,
          //     text: 'Are you sure you want to delete this monthly plan?',
          //     confirmBtnText: 'Yes',
          //     onConfirmBtnTap: () async {
          //       Navigator.pop(context);
          //       await context.read<UpdateMonthlyPlanCubit>().deleteMonthlyPlan(widget.id ?? 0, () async {
          //         Navigator.pop(context);
          //         QuickAlert.show(context: context, type: QuickAlertType.success, title: 'Success', text: 'Monthly plan deleted successfully,please create new monthly plan', animType: QuickAlertAnimType.scale, onConfirmBtnTap: () {
          //           Navigator.pop(context);
          //           Navigator.pop(context);
          //         }, confirmBtnText: 'Okay', confirmBtnColor: Colors.black, barrierDismissible: false);
          //       },() {
          //         Navigator.pop(context);
          //         QuickAlert.show(context: context, type: QuickAlertType.error, title: 'Failed', text: 'Failed to delete monthly plan', animType: QuickAlertAnimType.scale, onConfirmBtnTap: () {
          //           Navigator.pop(context);
          //         }, confirmBtnText: 'Okay', confirmBtnColor: Colors.black, barrierDismissible: false);
          //       });
          //     },
          //     type: QuickAlertType.confirm,title: "Delete");
          //   }
          // }, icon: Icon(Icons.delete)),
        ],
      ),
      body: const SafeArea(child: UpdateMonthlyPlanBodyWidget()),
    );
  }
}