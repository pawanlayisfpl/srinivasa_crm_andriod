// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_state.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/cubit/daily_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Daily%20Plan/cubit/state/daily_plan_state.dart';

class DaiilyPlanDateTextField extends StatelessWidget {
    final bool? isClickEnabled;

  const DaiilyPlanDateTextField({
    Key? key,
    this.isClickEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyPlanCubit, DailyPlanState>(
      builder: (context, state) {
        return CommonTextfield(
          onTapFunction: () => context.read<DailyPlanCubit>().pickDailyPlanDate(context: context),
          
          
          readOnly: true,
        

          textEditingController: context.watch<DailyPlanCubit>().dateController,
          onChanged: (String? value) {
            // if(value != null) {
            //   context.read<CreateMonthlyPlanCubit>().onDateFieldChange(dateField: value);
            // }
          },
          validator: (value) {
        return  state.dateField.value.fold(
              (l) => l.maybeMap(
                orElse: () => null, // Provide a default error message if needed
                empty: (_) => "Date is Empty",
                 
              ),
              (r) => null, // No error
            );
          },
          labelText: "Select Date",
          hintText: "Select your date",
          autovalidateMode:  state.showInputError == true ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
        );
      },
    );
  }

} 
