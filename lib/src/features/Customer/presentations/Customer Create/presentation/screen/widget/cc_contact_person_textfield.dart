import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';

class CCContactPersonTextField extends StatelessWidget {
  const CCContactPersonTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (context, state) {
        return CommonTextfield(
        
          textEditingController: context.read<CustomerCreateCubit>().contactPersonController, onChanged: (value) {
          context.read<CustomerCreateCubit>().changeContactPerson(contactPerson: value);
        }, validator: (val) => state.customerCreateContactPersonField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (value) => "Contact person is empty",tooShort: (value) => "Contact person name is too short",), (r) => null), labelText: "Contact Person", hintText: "Enter contact person name", autovalidateMode: state.showInputError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction);
      },
    );
  }
}
