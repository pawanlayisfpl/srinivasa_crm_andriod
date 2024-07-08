import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';

class CCMandalTextFieldWidget extends StatelessWidget {
  const CCMandalTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (context, state) {
        return CommonTextfield(
        
          textEditingController: context.read<CustomerCreateCubit>().mandalController, onChanged: (value) {
          context.read<CustomerCreateCubit>().changeMandal(mandal: value);
        }, validator: (val) => state.customerCreateMandalField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (value) => "Mandal is empty",tooShort: (value) => "Mandal is too short",), (r) => null), labelText: "Mandal", hintText: "Enter customer mandal", autovalidateMode: state.showInputError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction);
      },
    );
  }
}
