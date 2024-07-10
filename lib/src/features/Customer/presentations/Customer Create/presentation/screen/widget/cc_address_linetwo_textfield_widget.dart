import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';

class CCAddressLineTwoTextFieldWidget extends StatelessWidget {
  const CCAddressLineTwoTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (context, state) {
        return CommonTextfield(
          maxLines: 4,
        
          textEditingController: context.read<CustomerCreateCubit>().addressLineTwoController, onChanged: (value) {
          context.read<CustomerCreateCubit>().changeAddressLineTwo(addressLineTwo: value);
        }, validator: (val) => state.customerCreateAddressLineTwoField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (value) => "Address line two is empty",tooShort: (value) => "Address line two is too short",), (r) => null), labelText: "Address Line Two", hintText: "Enter address line two", autovalidateMode: state.showInputError ? AutovalidateMode.disabled : AutovalidateMode.disabled);
      },
    );
  }
}
