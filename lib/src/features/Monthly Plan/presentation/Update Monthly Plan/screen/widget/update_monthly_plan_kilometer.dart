import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/state/update_monthly_plan_state.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Update%20Monthly%20Plan/cubit/update_monthly_plan_cubit.dart';

class UpdateMonthlyPlanKilometerTextWidget extends StatelessWidget {
  
  const UpdateMonthlyPlanKilometerTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateMonthlyPlanCubit, UpdateMonthlyPlanState>(
      builder: (context, state) {
        return CommonTextfield(
          
          readOnly: false,
       
        

          textEditingController: context.watch<UpdateMonthlyPlanCubit>().approxController,
          onChanged: (String? value) {
            if(value != null) {
              context.read<UpdateMonthlyPlanCubit>().onKiloMeterChange(value: value);
            }
          },
          validator: (value) {
        state.monthlyPlanKiloMeterTextField.value.fold(
              (l) => l.maybeMap(
                orElse: () => null, // Provide a default error message if needed
                empty: (_) => "Approx kilometer is empty",
                 
              ),
              (r) => null, // No error
            );},
          // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textInputType: TextInputType.number,
          labelText: "Approx Kilometer",
          hintText: "Enter Approx Kilometer",
          autovalidateMode: AutovalidateMode.always ,
          // autovalidateMode:  state.showInputError == true ? AutovalidateMode.always : AutovalidateMode.always,
        );
      },
    );
  }

} 