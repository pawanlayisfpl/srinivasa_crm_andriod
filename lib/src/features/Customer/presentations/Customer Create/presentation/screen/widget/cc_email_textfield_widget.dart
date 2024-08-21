import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';

class CCEmailTextFieldWidget extends StatelessWidget {
  const CCEmailTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (context, state) {
        return CommonTextfield(
            textEditingController:
                context.read<CustomerCreateCubit>().emailController,
            onChanged: (value) {
              context
                  .read<CustomerCreateCubit>()
                  .changeEmail(email: value);
            },
            validator: (val) =>
                state.customerCreateEmailField.value.fold(
                    (l) => l.maybeMap(
                          orElse: () => null,
                          empty: (value) => "Email is empty",
                          invalidEmail: (value) => "Invalid email address",
                        ),
                    (r) => null),
            hintText: "Enter customer email address",
            textInputType: TextInputType.emailAddress,
            autovalidateMode: state.showInputError
                ? AutovalidateMode.disabled
                : AutovalidateMode.disabled);
      },
    );
  }
}
