import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/common/fields/string_field.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';

class SocCustomerCodeTextField extends StatelessWidget {
  const SocCustomerCodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SalesOrderCreateCubit, SalesOrderCreateState,StringField>(
      selector: (state) {
        return state.customerCodeField;
      },
      builder: (context, state) {
        return CommonTextfield(textEditingController: context.read<SalesOrderCreateCubit>().customerCodeController , onChanged: (String? value) { }, validator: (v) => null, labelText: "Customer Code", hintText: "Enter customr code", autovalidateMode: AutovalidateMode.disabled);
      },
    );
  }
}
