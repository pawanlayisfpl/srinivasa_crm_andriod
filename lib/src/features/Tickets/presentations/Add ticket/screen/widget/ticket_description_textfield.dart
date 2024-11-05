import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/cubit/add_ticket_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Tickets/presentations/cubit/state/add_ticket_state.dart';

class TicketDespTextFieldWidget extends StatelessWidget {
  const TicketDespTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTicketCubit, AddTicketState>(
      builder: (context, state) {
        return CommonTextfield(
          maxLines: 6,
            textEditingController:
                context.read<AddTicketCubit>().descriptionController,
            onChanged: (value) {
              context
                  .read<AddTicketCubit>()
                  .onChangeDescription(  value);
            },
            validator: (val) =>
                state.descriptionField.value.fold(
                    (l) => l.maybeMap(
                          orElse: () => null,
                          empty: (value) => "Description is empty",
                          tooShort: (value) => "Description is too short",
                        ),
                    (r) => null),
            hintText: "Enter your description ",
            autovalidateMode: state.showInputError
                ? AutovalidateMode.always
                : AutovalidateMode.onUserInteraction);
      },
    );
  }
}
