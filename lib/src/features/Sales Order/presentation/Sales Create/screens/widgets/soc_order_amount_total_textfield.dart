import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';

class SocTotalOrderAmountTextField extends StatelessWidget {
  const SocTotalOrderAmountTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SalesOrderCreateCubit, SalesOrderCreateState,NumberField>(
      selector: (state) {
        return state.orderAmountField;
      },
      builder: (context, state) {
        return CommonTextfield(
          
          fillColor: AppColors.textFieldBgColor,
          
          textEditingController: context.read<SalesOrderCreateCubit>().orderAmountTotalController ,readOnly: true, onChanged: (String? value) { }, validator: (v) => null,  hintText: "Enter order amount total", autovalidateMode: AutovalidateMode.always);
      },
    );
  }
}
