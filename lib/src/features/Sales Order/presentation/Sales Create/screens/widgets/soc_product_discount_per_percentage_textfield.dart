import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/config/config.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/sales_order_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Sales%20Order/presentation/Sales%20Create/cubit/state/sales_order_create_state.dart';

class SocProductDiscountPerPercentageTextField extends StatelessWidget {
  const SocProductDiscountPerPercentageTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderCreateCubit, SalesOrderCreateState>(
      builder: (context, state) {
        return CommonTextfield(
          onTapFunction: () {
            context.read<SalesOrderCreateCubit>().onDiscountPerPercentageClicked();
          },
            fillColor: AppColors.textFieldBgColor,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
            ],
            textInputType: TextInputType.number,
            textEditingController:
                context.read<SalesOrderCreateCubit>().productDiscountPerPercentage,
            onChanged: (String? value) => context.read<SalesOrderCreateCubit>().onDiscountPerPercentageChanged(),
            validator: (v) => null,
            hintText: "Enter discount per percentage",
            autovalidateMode: AutovalidateMode.disabled);
      },
    );
  }
}
