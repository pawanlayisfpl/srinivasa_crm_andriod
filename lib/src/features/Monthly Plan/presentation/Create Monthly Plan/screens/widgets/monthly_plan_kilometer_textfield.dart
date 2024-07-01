import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_state.dart';

class MonthlyPlanKilometerTextField extends StatelessWidget {
  
  const MonthlyPlanKilometerTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateMonthlyPlanCubit, CreateMonthlyPlanState>(
      builder: (context, state) {
        return CommonTextfield(
          
          readOnly: false,
       
        

          textEditingController: context.watch<CreateMonthlyPlanCubit>().kilometerTextEditingController,
          onChanged: (String? value) {
            if(value != null) {
              context.read<CreateMonthlyPlanCubit>().onKiloMeterChange(value: value);
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
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textInputType: TextInputType.number,
          labelText: "Approx Kilometer",
          hintText: "Enter Approx Kilometer",
          autovalidateMode:  state.showInputError == true ? AutovalidateMode.always : AutovalidateMode.always,
        );
      },
    );
  }

} 