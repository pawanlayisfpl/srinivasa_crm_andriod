import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';

class CCAddressTextFieldWidget extends StatelessWidget {
  const CCAddressTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (context, state) {
        return CommonTextfield(
          maxLength: 250,
          textInputType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          maxLines: 4,
        
          textEditingController: context.read<CustomerCreateCubit>().addressController, onChanged: (value) {
          context.read<CustomerCreateCubit>().changeAddress(address: value);
        }, validator: (val) => state.customerCreateAddressField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (value) => "Address  is empty",tooShort: (value) => "Address is too short,\nminimum 15 characters are required",), (r) => null), labelText: "Address", hintText: "Enter customer address", autovalidateMode: state.showInputError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction);
      },
    );
  }
}
