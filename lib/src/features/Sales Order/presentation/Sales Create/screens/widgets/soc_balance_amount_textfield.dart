import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';

class SocBalanceAmountTextField extends StatelessWidget {
  const SocBalanceAmountTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SalesOrderCreateCubit, SalesOrderCreateState,NumberField>(
      selector: (state) {
        return state.balanceAmountField;
      },
      builder: (context, state) {
        return CommonTextfield(
          readOnly: true,
          fillColor: AppColors.textFieldBgColor,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
          textInputType: TextInputType.number,
          
          textEditingController: context.watch<SalesOrderCreateCubit>().balanceAmountController , onChanged: (String? value) { }, validator: (v) => null,  hintText: "Enter Balance Amount", autovalidateMode: AutovalidateMode.always);
      },
    );
  }
}
