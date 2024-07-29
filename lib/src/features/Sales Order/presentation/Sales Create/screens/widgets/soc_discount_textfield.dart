import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';

class SocDiscountTextField extends StatelessWidget {
  const SocDiscountTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SalesOrderCreateCubit, SalesOrderCreateState,NumberField>(
      selector: (state) {
        return state.orderAmountField;
      },
      builder: (context, state) {
        return CommonTextfield(
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
          textInputType: TextInputType.number,
          
          textEditingController: context.watch<SalesOrderCreateCubit>().discountController , onChanged: (String? value) => context.read<SalesOrderCreateCubit>().onDiscountPerQtyChanged(), validator: (v) => null, labelText: "Discount Amount", hintText: "Enter discount amount", autovalidateMode: AutovalidateMode.always);
      },
    );
  }
}
