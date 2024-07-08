import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';

class CCNameTextFieldWidget extends StatelessWidget {
  const CCNameTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (context, state) {
        return CommonTextfield(
        
          textEditingController: context.read<CustomerCreateCubit>().customerNameController, onChanged: (value) {
          context.read<CustomerCreateCubit>().changeCustomerName(customerName: value);
        }, validator: (val) => state.customerCreateCustomerNameField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (value) => "Name is empty",tooShort: (value) => "Name is too short",), (r) => null), labelText: "Name", hintText: "Enter customer name", autovalidateMode: state.showInputError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction);
      },
    );
  }
}
