import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';

class SocAmountPaidController extends StatelessWidget {
  const SocAmountPaidController({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonTextfield(
          fillColor: AppColors.textFieldBgColor,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))],
          textInputType: TextInputType.number,
          
          textEditingController: context.read<SalesOrderCreateCubit>().amountPaidController , onChanged: (String? value) => context.read<SalesOrderCreateCubit>().onAmountPaidChanged("") ,validator: (v) => null,  hintText: "Enter paid amount", autovalidateMode: AutovalidateMode.disabled);
  }
}
