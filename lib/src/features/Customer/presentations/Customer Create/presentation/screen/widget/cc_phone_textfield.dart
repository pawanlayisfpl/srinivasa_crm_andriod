import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';

class CCPhoneTextFieldWidget extends StatelessWidget {
  const CCPhoneTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (context, state) {
        return CommonTextfield(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(10)
          ],
          textInputType: TextInputType.phone,
          textEditingController: context.read<CustomerCreateCubit>().phoneController, onChanged: (value) {
          context.read<CustomerCreateCubit>().changePhone(phone: value);
        
        }, validator: (val) => state.customerPhoneField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (value) => "Phone is empty",invalidPhoneNumber: (val) => "Invalid Phone Number"), (r) => null), labelText: "Phone", hintText: "Enter customer phone", autovalidateMode: state.showInputError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction);
      },
    );
  }
}
