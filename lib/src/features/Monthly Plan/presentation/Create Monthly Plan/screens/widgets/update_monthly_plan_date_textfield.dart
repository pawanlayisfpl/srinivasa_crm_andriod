// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/state/update_monthly_plan_state.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/update_monthly_plan_cubit.dart';

class UpdateMonthlyPlanDateTextFieldWidget extends StatelessWidget {
    final bool? isClickEnabled;

  const UpdateMonthlyPlanDateTextFieldWidget({
    super.key,
    this.isClickEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateMonthlyPlanCubit, UpdateMonthlyPlanState>(
      builder: (context, state) {
        return CommonTextfield(
          onTapFunction: isClickEnabled == null ? () {} : () {
            context.read<UpdateMonthlyPlanCubit>().showDatePickedDialog(context: context);
          
          },
          readOnly: true,
        

          textEditingController: context.watch<UpdateMonthlyPlanCubit>().dateController,
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
          autovalidateMode: AutovalidateMode.disabled,
          // autovalidateMode:  state. showInputError== true ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
        );
      },
    );
  }

} 
