import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';

class SocAssignedToRemarksTextField extends StatelessWidget {
  const SocAssignedToRemarksTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderCreateCubit, SalesOrderCreateState>(
      builder: (context, state) {
        return CommonTextfield(
          fillColor: AppColors.textFieldBgColor,
          textEditingController: context.read<SalesOrderCreateCubit>().assignedToRemarksController, onChanged: (String? value) => value == null ? null : context.read<SalesOrderCreateCubit>().onAssignedToRemarksChanged(value), validator: (c) => state.remarksToAssignedField.value.fold((l) => l.maybeMap(orElse: () {},empty: (e) => "Remarks can't be empty"),(r) => null) ,  hintText: "Enter your remakrs",maxLines: 4, autovalidateMode: state.showInputError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction);
      },
    );
  }
}
