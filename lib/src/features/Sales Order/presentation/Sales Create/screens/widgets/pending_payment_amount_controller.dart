import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/common/fields/string_field.dart';
import 'package:srinivasa_crm_new/src/config/constants/app_colors.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';

class PendingPaymentAmountTextfield extends StatelessWidget {
  const PendingPaymentAmountTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SalesOrderCreateCubit, SalesOrderCreateState,NumberField>(
      selector: (state) {
        return state.orderAmountField;
      },
      builder: (context, state) {
        return CommonTextfield(
          
          fillColor: AppColors.textFieldBgColor,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10)
          ],
          textInputType: TextInputType.number,
          textInputAction: TextInputAction.next,
          textEditingController: context.watch<SalesOrderCreateCubit>().pendingPaymentAmountController , onChanged: (String? value) => context.read<SalesOrderCreateCubit>().onDueAmountChanged(), validator: (v) => null, hintText: "Enter pending amount", autovalidateMode: AutovalidateMode.disabled);
      },
    );
  }
}
