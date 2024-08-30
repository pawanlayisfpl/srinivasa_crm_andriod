// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:srinivasa_crm_new/src/common/common.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_cubit.dart';
import 'package:srinivasa_crm_new/src/features/Monthly%20Plan/presentation/Create%20Monthly%20Plan/cubit/create_monthly_plan_state.dart';
import 'package:srinivasa_crm_new/src/features/User%20Activity/presentation/cubit/state/user_activity_state.dart';

import '../../cubit/user_activity_cubit.dart';

class UserActivityDateTextFieldWidget extends StatelessWidget {
    final bool? isClickEnabled;

  const UserActivityDateTextFieldWidget({
    Key? key,
    this.isClickEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserActivityCubit, UserActivityState>(
      builder: (context, state) {
        return CommonTextfield(
          onTapFunction: isClickEnabled == null ? () {} : () {
            context.read<UserActivityCubit>().pickDate(context);
          
          },
          readOnly: true,
        

          textEditingController: context.watch<UserActivityCubit>().dateController,
          onChanged: (String? value) {
            // if(value != null) {
            //   context.read<UserActivityCubit>().onDateFieldChange(dateField: value);
            // }
          },
          validator: (value)  => null,
          labelText: "Select Date",
          hintText: "Select your date",
          autovalidateMode:  AutovalidateMode.always ,
        );
      },
    );
  }

} 
