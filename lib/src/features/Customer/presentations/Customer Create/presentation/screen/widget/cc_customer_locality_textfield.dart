import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';

class CCLocalityTextFieldWidget extends StatelessWidget {
  const CCLocalityTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (context, state) {
        return CommonTextfield(
        
          textEditingController: context.read<CustomerCreateCubit>().localityController, onChanged: (value) {
          context.read<CustomerCreateCubit>().changeLocality(locality: value);
        }, validator: (val) => state.customerCreateLocalityField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (value) => "Locality is empty",tooShort: (value) => "Locality is too short",), (r) => null), labelText: "Locality", hintText: "Enter customer locality", autovalidateMode: state.showInputError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction);
      },
    );
  }
}
