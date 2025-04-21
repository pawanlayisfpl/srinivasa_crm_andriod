import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srinivasa_crm_new/src/common/common.dart';
import '../../../../../../mark attendance/presentations/cubit/cubit/mark_attendance_cubit.dart';
import '../../../../../../mark attendance/presentations/cubit/cubit/mark_attendance_state.dart'; 


class CCOdometerTextFieldWidget extends StatelessWidget {
  const CCOdometerTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarkAttendanceCubit, MarkAttendanceState>(
      builder: (context, state) {
        return CommonTextfield(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(12)
          ],
          textInputType: TextInputType.phone,
          textEditingController: context.read<MarkAttendanceCubit>().odometerController, onChanged: (value) {
          context.read<MarkAttendanceCubit>().changeMobile(mobile: value,enteredValue:(context.read<MarkAttendanceCubit>().odometerController.text!="")? int.parse(context.read<MarkAttendanceCubit>().odometerController.text):0);
        
        }, validator: (val) => state.marketOdometerField.value.fold((l) => l.maybeMap(orElse: () => null,empty: (value) => "Odometer number is empty",invalidPhoneNumber: (val) => ""), (r) => null),  hintText: "Enter Odometer Reading", autovalidateMode: state.showInputError ? AutovalidateMode.always : AutovalidateMode.onUserInteraction);
      },
    );
  }
}
