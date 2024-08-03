import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';

class CCCreditLimitTextField extends StatelessWidget {
  const CCCreditLimitTextField({super.key});

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
            textEditingController:
                context.read<CustomerCreateCubit>().creditLimitController,
            onChanged: (value) {
              context
                  .read<CustomerCreateCubit>()
                  .changeCreditLimit(value: value);
            },
            validator: (val) => state.customerCreateCreditLimitField.value.fold(
                (l) => l.maybeMap(
                      orElse: () => null,
                      empty: (value) => "Credit limit is empty",
                    ),
                (r) => null),
            hintText: "Enter customer credit limit",
            autovalidateMode: state.showInputError
                ? AutovalidateMode.disabled
                : AutovalidateMode.disabled);
      },
    );
  }
}
