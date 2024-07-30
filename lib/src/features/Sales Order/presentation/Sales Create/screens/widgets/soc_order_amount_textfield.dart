import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/fields/number_field.dart';
import 'package:srinivasa_crm_new/src/common/fields/string_field.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';

class SocOrderAmountTextField extends StatelessWidget {
  const SocOrderAmountTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonTextfield(
          readOnly: true,
          fillColor: Colors.grey,
          textEditingController: context.watch<SalesOrderCreateCubit>().orderAmountTotalController , onChanged: (String? value) { }, validator: (v) => null, hintText: "Enter order amount", autovalidateMode: AutovalidateMode.disabled);
  }
}
