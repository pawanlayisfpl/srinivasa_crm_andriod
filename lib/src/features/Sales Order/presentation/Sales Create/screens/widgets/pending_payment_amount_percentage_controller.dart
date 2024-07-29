import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';

import '../../../../../../config/constants/app_colors.dart';

class PendingPaymentDuePercentageTextField extends StatelessWidget {
  const PendingPaymentDuePercentageTextField({super.key});

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
          textEditingController: context.watch<SalesOrderCreateCubit>().pendingPaymentAmountPerentageController , onChanged: (String? value)  => context.read<SalesOrderCreateCubit>().onDuePercentageChanged(), validator: (v) => null,  hintText: "Enter pending amount percentage", autovalidateMode: AutovalidateMode.disabled);
      },
    );
  }
}
