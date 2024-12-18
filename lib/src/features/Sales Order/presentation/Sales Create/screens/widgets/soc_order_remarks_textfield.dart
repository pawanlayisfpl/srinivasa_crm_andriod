import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';

import '../../../../../../config/config.dart';

class SocOrderRemakrsTextField extends StatelessWidget {
  const SocOrderRemakrsTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderCreateCubit, SalesOrderCreateState>(
      builder: (context, state) {
        return CommonTextfield(
          fillColor: AppColors.textFieldBgColor,
          
          textEditingController: context.read<SalesOrderCreateCubit>().orderRemarksController, onChanged: (String? value) => value == null ? null : context.read<SalesOrderCreateCubit>().onOrderRemarksChanged(value), validator: (c) => null ,  hintText: "Enter Your Remarks",maxLines: 4, autovalidateMode: AutovalidateMode.disabled,);
      },
    );
  }
}
