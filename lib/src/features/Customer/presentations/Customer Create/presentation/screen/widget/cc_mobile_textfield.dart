import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/customer_create_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Customer/presentations/Customer%20Create/presentation/cubit/state/customer_create_state.dart';

class CCMobileTextFieldWidget extends StatelessWidget {
  const CCMobileTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCreateCubit, CustomerCreateState>(
      builder: (context, state) {
        return CommonTextfield(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(10)
          ],
          textInputType: TextInputType.phone,
          textEditingController: context.read<CustomerCreateCubit>().mobileController, onChanged: (value) {
          context.read<CustomerCreateCubit>().changeMobile(mobile: value);
        
        }, validator: (val) => state.customerMobileField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (value) => "Mobile number is empty",invalidPhoneNumber: (val) => "Invalid mobile phone"), (r) => null),  hintText: "Enter customer mobile number", autovalidateMode: state.showInputError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction);
      },
    );
  }
}
