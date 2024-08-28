import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';

class CCFarmNameTextFieldWidget extends StatelessWidget {
  const CCFarmNameTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (context, state) {
        return CommonTextfield(
            textEditingController:
                context.read<CustomerCreateCubit>().farmNameController,
            onChanged: (value) {
              context
                  .read<CustomerCreateCubit>()
                  .changeFarmName(farmName: value);
            },
            validator: (val) =>
                state.farmNameField.value.fold(
                    (l) => l.maybeMap(
                          orElse: () => null,
                          empty: (value) => "Farm name is empty",
                          tooShort: (value) => "Farm name is too short",
                        ),
                    (r) => null),
            hintText: "Enter farm name",
            autovalidateMode: state.showInputError
                ? AutovalidateMode.always
                : AutovalidateMode.onUserInteraction);
      },
    );
  }
}
