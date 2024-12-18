import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';

import '../../../../../../config/config.dart';

class SocAssignedToTextField extends StatelessWidget {
  const SocAssignedToTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderCreateCubit, SalesOrderCreateState>(
      builder: (context, state) {
        return CommonTextfield(
          fillColor: AppColors.textFieldBgColor,
          
          textEditingController: context.read<SalesOrderCreateCubit>().employeeIdController, onChanged: (String? value) => null, validator: (c) => null ,readOnly: true,  hintText: "Enter Your Employe Id",maxLines: 1, autovalidateMode: AutovalidateMode.disabled,);
      },
    );
  }
}
