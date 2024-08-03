import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';

class CCPincodeTextField extends StatelessWidget {
  const CCPincodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (context, state) {
        return CommonTextfield(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              LengthLimitingTextInputFormatter(6)
            ],
            textInputType: TextInputType.phone,
            textEditingController:
                context.read<CustomerCreateCubit>().pincodeController,
            onChanged: (value) {
              context.read<CustomerCreateCubit>().changePincode(pincode: value);
            },
            validator: (val) => state.customerCreatePincodeField.value.fold(
                (l) => l.maybeMap(
                    orElse: () => null,
                    empty: (value) => "Pincode is empty",
                    invalidPincode: (value) =>
                        "(${value.failedValue.toString()}) is invalid pincode"),
                (r) => null),
            hintText: "Enter customer pincode",
            autovalidateMode: state.showInputError
                ? AutovalidateMode.always
                : AutovalidateMode.onUserInteraction);
      },
    );
  }
}
